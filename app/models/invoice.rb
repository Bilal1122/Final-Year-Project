class Invoice < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	# scope :this_months_invoice, lambda { where("EXTRACT(MONTH FROM created_at)) = ?", Time.zone.now.month) }
	scope :this_months_invoice, lambda { where("created_at >= ? AND created_at <= ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month) }
	scope :this_months_invoice_history, lambda { where("created_at < ?", Time.zone.now.beginning_of_month) }
end
