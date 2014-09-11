class ApiKey < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :name
      t.string :access_token
      t.boolean :active
    end
  end
end
