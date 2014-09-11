class AddReasonToChanges < ActiveRecord::Migration
  def change
    add_column :changes, :reason, :text
  end
end
