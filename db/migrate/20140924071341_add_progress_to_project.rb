class AddProgressToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :progress, :string
  end
end
