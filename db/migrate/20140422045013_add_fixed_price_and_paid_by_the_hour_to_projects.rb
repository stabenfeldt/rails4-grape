class AddFixedPriceAndPaidByTheHourToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :fixed_price, :boolean
    add_column :projects, :paid_by_the_hour, :boolean
    add_column :projects, :hour_rate, :float
  end
end
