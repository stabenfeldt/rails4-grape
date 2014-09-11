class AddNewFieldsToHoursSpents < ActiveRecord::Migration
  def change
    add_column :hours_spents, :notes, :string
    add_column :hours_spents, :piecework_hours, :integer
    add_column :hours_spents, :overtime_50,  :integer
    add_column :hours_spents, :overtime_100, :integer
  end
end
