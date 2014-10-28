class AddDetailsToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :todays_task, :text, :limit => nil
  	add_column :reports, :tomorrows_task, :text, :limit => nil
  end
end
