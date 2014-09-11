class AddPriceTotalToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :price_total, :integer
  end
end
