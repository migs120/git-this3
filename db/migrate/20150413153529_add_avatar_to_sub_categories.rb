class AddAvatarToSubCategories < ActiveRecord::Migration
  def change
    add_column :sub_categories, :avatar, :string
  end
end
