class Leave < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	# scope :applications -> { where(status: ['Approved', 'Reected', 'pending']) }
end
