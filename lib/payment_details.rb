class PaymentDetails
  attr_accessor :payment, :errors, :params

  def initialize(payment, params)
    self.payment = payment
    self.params = params
    self.errors = []
  end

  def save
    if payment.details_submitted?
      errors << "Payment Details can be submitted only once."
    else
      payment.validate_bank_details = true
      unless payment.update_attributes(params)
        errors << payment.errors.full_messages.to_sentence
      end
    end
    errors.empty?
  end
end
