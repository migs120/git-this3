class Item < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :user
  has_many :item_pics, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  mount_uploader :product, ProductUploader
  
  #validates :product, inclusion: { in: %w( pdf ),
   # message: "%{value} is not a valid format" }
  
end
