class ItemPic < ActiveRecord::Base
  belongs_to :item
   mount_uploader :avatar, AvatarUploader
end
