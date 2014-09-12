class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
     t.string :name
     t.datetime :start_date
     t.datetime :estimated_end_date
     t.integer :manager_id
     t.timestamps
    end
  end
end
