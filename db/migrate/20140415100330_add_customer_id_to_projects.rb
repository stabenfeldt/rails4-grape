class AddCustomerIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :customer_id, :integer
    remove_column :projects, :company_id
  end
end
