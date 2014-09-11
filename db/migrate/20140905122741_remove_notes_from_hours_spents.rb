class RemoveNotesFromHoursSpents < ActiveRecord::Migration
  def change
    remove_column :hours_spents, :notes
  end
end
