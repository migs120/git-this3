class CreatePalPurchases < ActiveRecord::Migration
  def change
    create_table :pal_purchases do |t|
      t.string :email
      t.integer :amount
      t.references :user, index: true
      t.references :item, index: true
      t.string :item_name

      t.timestamps
    end
  end
end
