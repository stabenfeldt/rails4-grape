class UpdateFieldsOnProjects < ActiveRecord::Migration

  def change
    add_column :projects, :billing_address, :string
    add_column :projects, :execution_address, :string
    add_column :projects, :delivery_address,  :string

    add_column :projects, :customer_reference,  :text
    add_column :projects, :comment,  :text

    remove_column :projects, :fixed_price
    remove_column :projects, :paid_by_the_hour
    remove_column :projects, :hour_rate
    remove_column :projects, :price_total
  end

end
