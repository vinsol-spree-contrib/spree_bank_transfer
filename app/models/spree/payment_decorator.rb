Spree::Payment.class_eval do
  attr_accessor :validate_bank_details
  validates :bank_name, :account_no, :transaction_reference_no, :presence => true, :if => :validate_bank_details

  scope :from_bank_transfer, -> { joins(:payment_method).where(:spree_payment_methods => { :type => 'Spree::PaymentMethod::BankTransfer' }) }
end