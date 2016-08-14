class AddEuropeanBankDetails < ActiveRecord::Migration
  def change
    add_column :spree_banks, :iban, :text
    add_column :spree_banks, :bic, :text
  end
end
