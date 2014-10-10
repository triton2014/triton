class CreateImageAttachements < ActiveRecord::Migration
  def change
    create_table :image_attachements do |t|
      t.integer :report_id
      t.string :image
      t.timestamps
    end
  end
end
