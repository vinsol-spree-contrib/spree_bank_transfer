require 'spec_helper' 

describe PaymentDetails do
  before do
    @payment = mock_model(Spree::Payment, :update_attributes => true, :validate_bank_details= => nil)
    @params = { 'bank_name' => 'bank_name', 'account_no' => "account_no", 'transaction_reference_no' => "transaction_reference_no" }
    @payment_details = PaymentDetails.new(@payment, @params)
  end

  describe "#initialize" do
    it "sets payment" do
      @payment_details.payment.should eq(@payment)
    end

    it "sets params" do
      @payment_details.params.should eq(@params)
    end

    it "initializes errors" do
      @payment_details.errors.should eq([])
    end
  end

  describe "#save" do
    context 'when payment details submitted' do
      before do
        @payment.stub(:details_submitted?).and_return(true)
      end

      it "sets errors" do
        @payment_details.save
        @payment_details.errors.should eq(["Payment Details can be submitted only once."])
      end

      it "does not update payment" do
        @payment.should_not_receive(:update_attributes)
        @payment_details.save
      end

      it "returns false" do
        @payment_details.save.should be_false
      end

    end

    context 'when payment details not submitted' do
      before do
        @payment.stub(:details_submitted?).and_return(false)
      end

      it 'sets validates_bank_details to true' do
        @payment.should_receive(:validate_bank_details=).with(true)
        @payment_details.save
      end

      it "updates payment attributes" do
        @payment.should_receive(:update_attributes)
        @payment_details.save
      end

      context 'when payment attributes not updated successfully' do
        before do
          @payment.stub(:update_attributes).and_return(false)
          @payment.stub_chain(:errors, :full_messages).and_return(["some error occurred"])
        end

        it 'sets errors' do
          @payment_details.save
          @payment_details.errors.should eq(["some error occurred"])
        end

        it 'returns false' do
          @payment_details.save.should be_false
        end
      end

      context 'when payment attributes updated successfully' do
        it 'returns true' do
          @payment_details.save.should be_true
        end
      end
    end
  end
end