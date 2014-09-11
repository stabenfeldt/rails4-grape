class AddDateAndDescriptionToHoursSpents < ActiveRecord::Migration
  def change
    add_column :hours_spents, :date, :date
    add_column :hours_spents, :description, :text
  end
end
