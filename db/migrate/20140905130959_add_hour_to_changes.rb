class AddHourToChanges < ActiveRecord::Migration
  def change
    add_column :changes, :hour, :integer
  end
end
