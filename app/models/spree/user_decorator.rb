Spree.user_class.class_eval do
  has_many :payments, through: :orders
end