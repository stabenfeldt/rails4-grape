class AddStarredToProjectsAndCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :starred, :boolean
    add_column :projects,  :starred, :boolean
  end
end
