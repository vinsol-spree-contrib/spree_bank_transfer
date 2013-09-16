class AddIndexOnActiveOnSpreeBank < ActiveRecord::Migration
  def change
    add_index :spree_banks, :active
  end
end
