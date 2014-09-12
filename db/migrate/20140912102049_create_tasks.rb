class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :report
      t.string :task_type 
      t.string :target_task
      t.string :completed_task
      t.string :efficiency
      t.timestamps
    end
  end
end
