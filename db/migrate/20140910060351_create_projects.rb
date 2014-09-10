class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
     t.string :name
     t.string :status
     t.string :note
     t.string :security_alert
     t.datetime :start_date
     t.datetime :end_date
     t.integer :manager_id

      t.timestamps
    end
  end
end
