class CreateHoursSpents < ActiveRecord::Migration
  def change
    create_table :hours_spents do |t|
      t.references :customer, index: true
      t.references :task, index: true
      t.integer :hour

      t.timestamps
    end
  end
end
