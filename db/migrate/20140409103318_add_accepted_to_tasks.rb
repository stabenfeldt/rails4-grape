class AddAcceptedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :accepted, :boolean
  end
end
