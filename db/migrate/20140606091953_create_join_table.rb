class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :tasks_users, id: false do |t|
      t.integer :task_id
      t.integer :user_id
    end
  end
end
