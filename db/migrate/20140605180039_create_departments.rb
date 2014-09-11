class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments, force: true do |t|
      t.string :title

      t.timestamps
    end
  end
end
