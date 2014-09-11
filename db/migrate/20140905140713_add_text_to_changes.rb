class AddTextToChanges < ActiveRecord::Migration
  def change
    add_column :changes, :text, :string
  end
end
