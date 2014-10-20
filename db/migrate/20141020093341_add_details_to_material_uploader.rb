class AddDetailsToMaterialUploader < ActiveRecord::Migration
  def change
  	add_column :material_attachements, :report_id, :integer
  	add_column :material_attachements, :material_image, :string
  end
end
