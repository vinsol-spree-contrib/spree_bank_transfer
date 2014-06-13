class AddColAdditionalDetailsToBanks < ActiveRecord::Migration
  def change
    add_column :spree_banks, :additional_details, :text
  end
end
