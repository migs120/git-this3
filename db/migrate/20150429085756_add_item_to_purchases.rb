class AddItemToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :Item_id, :integer
    add_column :purchases, :Item_name, :string
  end
end
