class CreateTableBank < ActiveRecord::Migration
  def change
     create_table :spree_banks do |t|
      t.string :name
      t.string :account_no
      t.string :bank_code
      t.string :iban
      t.string :bic
      t.text :infos
      t.boolean :active, :default => true      
    end
    add_index :spree_banks, [:name, :account_no], :unique => true
  end
end
