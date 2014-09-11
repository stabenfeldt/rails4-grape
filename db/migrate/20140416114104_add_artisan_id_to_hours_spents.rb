class AddArtisanIdToHoursSpents < ActiveRecord::Migration
  def change
    add_column :hours_spents, :artisan_id, :integer
  end
end
