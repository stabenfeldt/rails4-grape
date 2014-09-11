class AddEmployeeNrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employee_nr, :string
  end
end
