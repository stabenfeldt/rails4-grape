class AddPaintIdTopTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :paint_id, :integer
  end
end
