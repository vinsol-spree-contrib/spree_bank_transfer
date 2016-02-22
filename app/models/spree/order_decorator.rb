Spree::Order.class_eval do
  self.whitelisted_ransackable_associations += %w(payments)
end
