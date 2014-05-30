class AddColumnDepositedOnToSpreePayments < ActiveRecord::Migration
  def change
    add_column :spree_payments, :deposited_on, :date
  end
end
