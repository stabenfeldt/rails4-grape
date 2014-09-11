class RemoveAddressFieldsFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :billing_address
    remove_column :projects, :delivery_address
  end
end
