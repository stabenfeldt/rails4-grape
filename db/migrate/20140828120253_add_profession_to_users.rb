class AddProfessionToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :profession, index: true
  end
end
