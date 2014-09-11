class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.text :description
      t.integer :hours_spent_id, index: true
      t.integer :changed_by_user_id

      t.timestamps
    end
  end
end
