module Spree
  class Bank < ActiveRecord::Base
    validates :name, :account_no , presence: true
    validates_uniqueness_of :account_no , scope: :name

    scope :active, -> { where(active: true) }
  end
end