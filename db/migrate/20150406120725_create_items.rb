class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :body
      t.string :avatar
      t.references :sub_category, index: true

      t.timestamps
    end
  end
end
