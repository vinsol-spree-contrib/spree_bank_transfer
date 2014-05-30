require 'spec_helper'

describe Spree::PaymentsController do
  before do
    controller.stub(:authenticate_spree_user!).and_return(true)
    @user = mock_model(Spree::User, :generate_spree_api_key! => false, :last_incomplete_spree_order => nil)
    controller.stub(:spree_current_user).and_return(@user)
    
    @payment = mock_model(Spree::Payment)
    @current_user_payments = double("current_user_payments", :where => [@payment])
    @user.stub(:payments).and_return(@current_user_payments)
    request.env["HTTP_REFERER"] = "http://localhost"
  end

  shared_examples_for "request which finds payment" do

    it "finds payment" do
      @current_user_payments.should_receive(:where).with(:id => 'payment_id')
      send_request
    end

    it "assigns @payment" do
      send_request
      assigns(:payment).should eq(@payment)
    end

    context 'when payment not found' do
      before do
        @current_user_payments.stub(:where).and_return([])
      end

      it "sets flash message" do
        send_request
        flash[:error].should eq("Payment not found")
      end

      it "redirects to back" do
        send_request
        response.should redirect_to(:back)
      end
    end
  end

  describe "PATCH update" do
    before do
      @payment_details = double('payment_details', :save => true)
      PaymentDetails.stub(:new).and_return(@payment_details)
    end

    def send_request
      patch :update, :id => 'payment_id', :payment => { :bank_name => 'bank_name', :account_no => "account_no", :transaction_reference_no => "transaction_reference_no" }, :use_route => 'spree'
    end

    it_behaves_like "request which finds payment"


    it "creates new payment details" do
      PaymentDetails.should_receive(:new).with(@payment, { 'bank_name' => 'bank_name', 'account_no' => "account_no", 'transaction_reference_no' => "transaction_reference_no" })
      send_request
    end

    it "saves payment_details" do
      @payment_details.should_receive(:save)
      send_request
    end

    context 'when payment details saved successfully' do
      it 'sets flash message' do
        send_request
        flash[:notice].should eq("Payment successfully updated")
      end
    end

    context 'when payment details not saved' do
      before do
        @payment_details.stub(:save).and_return(false)
        @payment_details.stub(:errors).and_return(["some error occurred"])
      end

      it 'sets flash error' do
        send_request
        flash[:error].should eq("some error occurred")
      end
    end
    
    it "redirects to back" do
      send_request
      response.should redirect_to(:back)
    end
  end

  describe "#payment_params" do
    it "permits only bank_name, account_no, transaction_reference_no, deposited_on" do
      controller.params = { :payment => { :bank_name => 'Bank Name', :account_no => 'Account number', :transaction_reference_no => "transaction reference number", :order_id => 'order_id', :deposited_on => 'deposited_on' } }
      controller.send(:payment_params).should eq({ "bank_name" => "Bank Name", "account_no" => "Account number", "transaction_reference_no" => "transaction reference number", 'deposited_on' => 'deposited_on' })
    end
  end
end