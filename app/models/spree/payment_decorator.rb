Spree::Payment.class_eval do
  attr_accessor :validate_bank_details

  has_one_attached :receipt
  belongs_to :order
  validates :bank_name, :deposited_on, :receipt, presence: true, if: :validate_bank_details
  after_save :update_order_state, if: :validate_bank_details
  before_save :update_source_type, if: :validate_bank_details
  scope :from_bank_transfer, -> { joins(:payment_method).where(spree_payment_methods: { type: 'Spree::PaymentMethod::BankTransfer' }) }

  self.whitelisted_ransackable_attributes = %w( bank_name state )

  def details_submitted?
    bank_name?
  end

  private

  def update_source_type
    self.source_type = "Spree::PaymentMethod::BankTransfer"
  end

  def update_order_state
    order.update(payment_state: :paid)
  end
end
