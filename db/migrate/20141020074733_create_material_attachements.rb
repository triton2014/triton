class CreateMaterialAttachements < ActiveRecord::Migration
  def change
    create_table :material_attachements do |t|
      
      t.timestamps
    end
  end
end
