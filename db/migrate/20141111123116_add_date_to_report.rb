class AddDateToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :report_date, :datetime
  end
end
