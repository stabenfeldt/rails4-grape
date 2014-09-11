class RenameArtisanIdToUserIdOnHoursSpent < ActiveRecord::Migration
  def change
    rename_column :hours_spents, :artisan_id, :user_id
  end
end
