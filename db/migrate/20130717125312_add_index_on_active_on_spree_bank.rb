class AddIndexOnActiveOnSpreeBank < SpreeExtension::Migration[4.2]
  def change
    add_index :spree_banks, :active
  end
end
