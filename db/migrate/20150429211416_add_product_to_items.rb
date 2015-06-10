class AddProductToItems < ActiveRecord::Migration
  def change
    add_column :items, :product, :string
  end
end
