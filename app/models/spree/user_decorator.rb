Spree::User.class_eval do
  has_many :payments, through: :orders
end