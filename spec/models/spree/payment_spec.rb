require 'spec_helper'

describe Spree::Payment do
  context 'when validate_bank_details' do
    before do
      subject.validate_bank_details = true
    end

    it { should validate_presence_of(:bank_name) }
    it { should validate_presence_of(:account_no) }
    it { should validate_presence_of(:transaction_reference_no) }
    it { should validate_presence_of(:deposited_on) }
  end

  context 'when validate_bank_details not true' do
    it { should_not validate_presence_of(:bank_name) }
    it { should_not validate_presence_of(:account_no) }
    it { should_not validate_presence_of(:transaction_reference_no) }
  end

  describe ".from_bank_transfer" do
    before do
      check_payment_method = Spree::PaymentMethod::Check.new
      check_payment_method.name = "Check Payment Method"
      check_payment_method.save!

      bank_transfer_payment_method = Spree::PaymentMethod::BankTransfer.new
      bank_transfer_payment_method.name = "Bank Transfer"
      bank_transfer_payment_method.save!

      @order = Spree::Order.new
      @order.save!
      
      @payment1 = Spree::Payment.new
      @payment1.order_id = @order.id
      @payment1.payment_method_id = check_payment_method.id
      @payment1.save!

      @payment2 = Spree::Payment.new
      @payment2.order_id = @order.id
      @payment2.payment_method_id = check_payment_method.id
      @payment2.save!

      @bank_transfer_payment1 = Spree::Payment.new
      @bank_transfer_payment1.order_id = @order.id
      @bank_transfer_payment1.payment_method_id = bank_transfer_payment_method.id
      @bank_transfer_payment1.save!

      @bank_transfer_payment2 = Spree::Payment.new
      @bank_transfer_payment2.order_id = @order.id
      @bank_transfer_payment2.payment_method_id = bank_transfer_payment_method.id
      @bank_transfer_payment2.save!
    end

    it "returns payments with payment method as bank_transfer" do
      Spree::Payment.from_bank_transfer.should =~ [@bank_transfer_payment1, @bank_transfer_payment2]
    end
  end

  describe "#details_submitted?" do
    before do
      @payment = Spree::Payment.new
    end

    context 'when transaction_reference_no present' do
      before do
        @payment.transaction_reference_no = 'transaction_reference_no'
      end

      it 'is true' do
        @payment.details_submitted?.should be_true
      end
    end

    context 'when transaction_reference_no not present' do
      it 'is false' do
        @payment.details_submitted?.should be_false
      end
    end
  end
end