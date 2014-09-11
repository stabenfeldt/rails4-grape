class BigintForFixedPrice < ActiveRecord::Migration
  def change
    add_column :projects, :price_total_tmp, :bigint
    Project.all.each { |p| p.update(price_total_tmp: p.price_total) }
    remove_column :projects, :price_total
    rename_column :projects, :price_total_tmp, :price_total
  end
end
