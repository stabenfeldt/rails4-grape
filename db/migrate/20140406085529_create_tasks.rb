class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :customer, index: true
      t.references :task_type, index: true
      t.datetime :start_date
      t.boolean :customer_buys_supplies

      t.timestamps
    end
  end
end
