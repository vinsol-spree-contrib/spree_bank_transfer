require 'spec_helper'

describe PaymentDetails do
  before do
    @payment = mock_model(Spree::Payment, update_attributes: true, :validate_bank_details= => nil)
    @params = { 'bank_name' => 'bank_name', 'account_no' => "account_no", 'transaction_reference_no' => "transaction_reference_no" }
    @payment_details = PaymentDetails.new(@payment, @params)
  end

  describe "#initialize" do
    it "sets payment" do
      expect(@payment_details.payment).to eq(@payment)
    end

    it "sets params" do
      expect(@payment_details.params).to eq(@params)
    end

    it "initializes errors" do
      expect(@payment_details.errors).to eq([])
    end
  end

  describe "#save" do
    context 'when payment details submitted' do
      before do
        allow(@payment).to receive(:details_submitted?).and_return(true)
      end

      it "sets errors" do
        @payment_details.save
        expect(@payment_details.errors).to eq(["Payment Details can be submitted only once."])
      end

      it "does not update payment" do
        expect(@payment).not_to receive(:update_attributes)
        @payment_details.save
      end

      it "returns false" do
        expect(@payment_details.save).to be false
      end

    end

    context 'when payment details not submitted' do
      before do
        allow(@payment).to receive(:details_submitted?).and_return(false)
      end

      it 'sets validates_bank_details to true' do
        expect(@payment).to receive(:validate_bank_details=).with(true)
        @payment_details.save
      end

      it "updates payment attributes" do
        expect(@payment).to receive(:update_attributes)
        @payment_details.save
      end

      context 'when payment attributes not updated successfully' do
        before do
          allow(@payment).to receive(:update_attributes).and_return(false)
          allow(@payment).to receive_message_chain(:errors, :full_messages).and_return(["some error occurred"])
        end

        it 'sets errors' do
          @payment_details.save
          expect(@payment_details.errors).to eq(["some error occurred"])
        end

        it 'returns false' do
          expect(@payment_details.save).to be false
        end
      end

      context 'when payment attributes updated successfully' do
        it 'returns true' do
          expect(@payment_details.save).to be true
        end
      end
    end
  end
end
