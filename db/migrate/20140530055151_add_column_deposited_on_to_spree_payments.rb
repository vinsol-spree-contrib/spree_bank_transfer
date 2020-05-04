class AddColumnDepositedOnToSpreePayments < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_payments, :deposited_on, :date
  end
end
