class RenameCategoryColumnOnProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :category_id
    add_column    :projects, :department_id, :integer
  end
end
