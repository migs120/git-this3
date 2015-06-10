class SubCategory < ActiveRecord::Base
  belongs_to :main_category
  has_many :items, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
