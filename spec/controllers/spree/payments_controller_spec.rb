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
      @payment.stub(:validate_bank_details=)
      @payment.stub(:update_attributes)
    end

    def send_request
      patch :update, :id => 'payment_id', :payment => { :bank_name => 'bank_name', :account_no => "account_no", :transaction_reference_no => "transaction_reference_no" }, :use_route => 'spree'
    end

    it_behaves_like "request which finds payment"

    it "sets validate_bank_details to true" do
      @payment.should_receive(:validate_bank_details=).with(true)
      send_request
    end

    it "update_attributes" do
      @payment.should_receive(:update_attributes).with("bank_name" => 'bank_name', "account_no" => "account_no", "transaction_reference_no" => "transaction_reference_no")
      send_request
    end

    context 'when payment updated' do
      before do
        @payment.stub(:update_attributes).and_return(true)
      end

      it "sets flash message" do
        send_request
        flash[:notice].should eq("Payment successfully updated")
      end
    end

    context 'when payment not updated' do
      before do
        @payment.stub(:update_attributes).and_return(false)
        @payment.stub_chain(:errors, :full_messages).and_return(["some error occurred"])
      end

      it "sets flash error" do
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
    it "permits only bank_name, account_no, transaction_reference_no" do
      controller.params = { :payment => { :bank_name => 'Bank Name', :account_no => 'Account number', :transaction_reference_no => "transaction reference number", :order_id => 'order_id' } }
      controller.send(:payment_params).should eq({ "bank_name" => "Bank Name", "account_no" => "Account number", "transaction_reference_no" => "transaction reference number" })
    end
  end
end