class CreateCustomerMessages < ActiveRecord::Migration
  def change
    create_table :customer_messages do |t|
      t.string :text

      t.timestamps
    end
  end
end
