class CreateArtisanTaskJoinTable < ActiveRecord::Migration
  def change
    create_table :artisans_tasks, id: false do |t|
      t.belongs_to :artisan
      t.belongs_to :task
    end
  end
end
