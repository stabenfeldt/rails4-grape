class AddEmpIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :emp_id, :string
  end
end
