class AddProjectIdToHoursSpent < ActiveRecord::Migration
  def change
    add_column :hours_spents, :project_id, :integer
  end
end
