class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :document
      t.integer :project_id

      t.timestamps
    end
  end
end
