class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :title
      t.text :body
      t.references :main_category, index: true

      t.timestamps
    end
  end
end
