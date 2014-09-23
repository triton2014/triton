class AddMaterialToReports < ActiveRecord::Migration
  def change
    add_column :reports, :material, :string
  end
end
