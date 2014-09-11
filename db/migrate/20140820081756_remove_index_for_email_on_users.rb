class RemoveIndexForEmailOnUsers < ActiveRecord::Migration
  remove_index :users, :email
end
