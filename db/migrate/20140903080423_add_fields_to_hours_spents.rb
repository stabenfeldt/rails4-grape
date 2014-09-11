class AddFieldsToHoursSpents < ActiveRecord::Migration
  def change
    add_column :hours_spents, :runs_in_company_car,     :integer
    add_column :hours_spents, :km_driven_own_car,       :float
    add_column :hours_spents, :toll_expenses_own_car,   :float
    add_column :hours_spents, :supplies_from_warehouse, :string
  end
end
