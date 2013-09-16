require 'spec_helper'

describe Spree::PaymentMethod::BankTransfer do
  before(:each) do
    @order = Spree::Order.new
    @payment_method = Spree::PaymentMethod::BankTransfer.create! :name => "Bank Transfer", :environment => Rails.env, :active => true
    @payment = Spree::Payment.new :amount => 0.0
    @payment.order = @order
    @payment.payment_method = @payment_method
    @payment.save!
  end

  describe "#actions" do
    it "returns actions" do
      @payment_method.actions.should eq(["capture", "void"])
    end
  end

  describe "#can_capture?" do
    context "when payment state is pending or checkout" do
      before(:each) do
        @payment.state = 'checkout'
        @payment.save!
      end

      it "returns true" do
        @payment_method.can_capture?(@payment).should be_true
      end
    end

    context "when payment state is pending" do
      before(:each) do
        @payment.state = 'pending'
        @payment.save!
      end

      it "returns true" do
        @payment_method.can_capture?(@payment).should be_true
      end

    end

    context "when payment state is not pending or checkout" do
      before(:each) do
        @payment.state = 'void'
        @payment.save!
      end

      it "returns false" do
        @payment_method.can_capture?(@payment).should be_false
      end
    end
  end
  
  describe "#can_void?" do
    context "when payment state is not void" do
      before(:each) do
        @payment.state = 'pending'
        @payment.save!
      end

      it "returns true" do
        @payment_method.can_void?(@payment).should be_true
      end
    end

    context "when payment state is void" do
      before(:each) do
        @payment.update_column(:state, 'void')
      end

      it "returns false" do
        @payment_method.can_void?(@payment).should be_false
      end
    end
  end

  describe "#capture" do
    it "creates a new active merchant billing response" do
      ActiveMerchant::Billing::Response.should_receive(:new).with(true, "", {}, {})
      @payment_method.capture
    end
    it "returns active merchant billing response" do
      @payment_method.capture.should be_a(ActiveMerchant::Billing::Response)
    end
  end

  describe "#void" do
    it "creates a new active merchant billing response" do
      ActiveMerchant::Billing::Response.should_receive(:new).with(true, "", {}, {})
      @payment_method.void
    end
    it "returns active merchant billing response" do
      @payment_method.void.should be_a(ActiveMerchant::Billing::Response)
    end
  end

  describe "#source_required?" do
    it "returns false" do
      @payment_method.source_required?.should be_false
    end
  end

end