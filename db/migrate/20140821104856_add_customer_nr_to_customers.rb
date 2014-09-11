class AddCustomerNrToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customer_nr, :integer
  end
end
