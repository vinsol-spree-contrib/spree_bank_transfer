require 'spec_helper'

describe Spree::PaymentsController, type: :controller do
  # Refer http://stackoverflow.com/a/38233837/306686
  ## Added to get around redirect_to deprectaion warning for Rspec
  let(:back) { "http://localhost" }

  before do
    allow(controller).to receive(:authenticate_spree_user!).and_return(true)
    @user = mock_model(Spree::User, :generate_spree_api_key! => false, last_incomplete_spree_order: nil)
    allow(controller).to receive(:spree_current_user).and_return(@user)

    @payment = mock_model(Spree::Payment)
    @current_user_payments = double("current_user_payments", find_by: @payment)
    allow(@user).to receive(:payments).and_return(@current_user_payments)
    request.env["HTTP_REFERER"] = back
  end

  shared_examples_for "request which finds payment" do

    it "finds payment" do
      expect(@current_user_payments).to receive(:find_by).with(number: 'payment_id')
      send_request
    end

    it "assigns @payment" do
      send_request
      expect(assigns(:payment)).to eq(@payment)
    end

    context 'when payment not found' do
      before do
        allow(@current_user_payments).to receive(:find_by).and_return(nil)
      end

      it "sets flash message" do
        send_request
        expect(flash[:error]).to eq("Payment not found")
      end

      it "redirects to back" do
        send_request
        expect(response).to redirect_to(back)
      end
    end
  end

  describe "PATCH update" do
    before do
      @payment_details = double('payment_details', save: true)
      allow(PaymentDetails).to receive(:new).and_return(@payment_details)
    end

    def send_request
      patch :update, params: {id: 'payment_id', payment: { bank_name: 'bank_name', account_no: "account_no", transaction_reference_no: "transaction_reference_no" }}
    end

    it_behaves_like "request which finds payment"


    it "creates new payment details" do
      pr = ActionController::Parameters.new('payment' => { 'bank_name' => 'bank_name', 'account_no' => "account_no", 'transaction_reference_no' => "transaction_reference_no" }).require(:payment).permit!
      expect(PaymentDetails).to receive(:new).with(@payment, pr)
      send_request
    end

    it "saves payment_details" do
      expect(@payment_details).to receive(:save)
      send_request
    end

    context 'when payment details saved successfully' do
      it 'sets flash message' do
        send_request
        expect(flash[:notice]).to eq("Payment successfully updated")
      end
    end

    context 'when payment details not saved' do
      before do
        allow(@payment_details).to receive(:save).and_return(false)
        allow(@payment_details).to receive(:errors).and_return(["some error occurred"])
      end

      it 'sets flash error' do
        send_request
        expect(flash[:error]).to eq("some error occurred")
      end
    end

    it "redirects to back" do
      send_request
      expect(response).to redirect_to(back)
    end
  end

  describe "#payment_params" do
    it "permits only bank_name, account_no, transaction_reference_no, deposited_on" do
      controller.params = { payment: { bank_name: 'Bank Name', account_no: 'Account number', transaction_reference_no: "transaction reference number", order_id: 'order_id', deposited_on: 'deposited_on' } }
      expect(controller.send(:payment_params).to_h).to eq({ "bank_name" => "Bank Name", "account_no" => "Account number", "transaction_reference_no" => "transaction reference number", 'deposited_on' => 'deposited_on' })
    end
  end
end
