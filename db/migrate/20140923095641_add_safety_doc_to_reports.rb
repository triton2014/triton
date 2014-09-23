class AddSafetyDocToReports < ActiveRecord::Migration
  def change
    add_column :reports, :safety_doc, :string
  end
end
