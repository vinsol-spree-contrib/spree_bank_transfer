module Spree
  class PaymentMethod::BankTransfer < PaymentMethod
    
    def actions
      %w{capture void}
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def capture(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def source_required?
      false
    end
      
    def credit(money, credit_card, response_code, options = {})
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end
  end
  
end
