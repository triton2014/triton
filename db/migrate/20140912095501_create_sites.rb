class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.belongs_to :project
      
      t.timestamps
    end
  end
end
