class MaterialAttachement < ActiveRecord::Base
	mount_uploader :material_image, MaterialUploader
	belongs_to :report
end
