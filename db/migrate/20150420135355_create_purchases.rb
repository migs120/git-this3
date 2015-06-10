class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.text :body
      t.integer :amount
      t.references :user, index: true

      t.timestamps
    end
  end
end
