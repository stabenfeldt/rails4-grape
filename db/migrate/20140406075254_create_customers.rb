class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :org_number
      t.string :contact_person
      t.string :phone

      t.timestamps
    end
  end
end
