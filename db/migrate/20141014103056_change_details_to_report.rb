class ChangeDetailsToReport < ActiveRecord::Migration
  def change
  	change_column :reports, :summary, :text, :limit => nil
  	change_column :reports, :safety_meeting, :text, :limit => nil
  	change_column :reports, :materials, :text, :limit => nil
  	change_column :reports, :project_start_condition, :text, :limit => nil
  	change_column :reports, :controls_in_place, :text, :limit => nil
  	change_column :reports, :todays_condition, :text, :limit => nil
  end
end
