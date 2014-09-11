class AddFieldsToChange < ActiveRecord::Migration
  def change
    add_column :changes, :runs_in_company_car,     :integer
    add_column :changes, :km_driven_own_car,       :float
    add_column :changes, :toll_expenses_own_car,   :float
    add_column :changes, :supplies_from_warehouse, :string
    add_column :changes, :piecework_hours,         :integer
    add_column :changes, :overtime_50,             :integer
    add_column :changes, :overtime_100,            :integer
  end
end
