class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.text :description
      t.integer :document_id
      t.integer :role_id

      t.timestamps
    end
  end
end
