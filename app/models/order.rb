class Order < ActiveRecord::Base

  has_many :gatepasses
	mount_uploader :image, ImageUploader
	mount_uploader :image1, ImageUploader
end
