class Report < ActiveRecord::Base
	belongs_to :site
	has_many :tasks
	mount_uploader :image, ImageUploader
	mount_uploader :material, MaterialUploader
	mount_uploader :safety_doc, SafetyDocUploader

end
