class MainCategory < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
end
