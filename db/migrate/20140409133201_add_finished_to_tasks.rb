class AddFinishedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :finished, :boolean, default: false
  end
end
