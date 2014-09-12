class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :site
      t.string :summary
      t.string :effciency
      t.string :report_type
      t.string :controls_in_place
      t.string :project_start_condition
      t.string :todays_condition
      t.string :safety_meeting
      t.string :materials
      t.timestamps
    end
  end
end
