class Report < ActiveRecord::Base
	belongs_to :site
	has_many :tasks
	mount_uploader :image, ImageUploader
end
