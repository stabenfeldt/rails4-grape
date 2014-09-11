class CreateArtisans < ActiveRecord::Migration
  def change
    create_table :artisans do |t|
      t.string :name
      t.references :tasks, index: true

      t.timestamps
    end
  end
end
