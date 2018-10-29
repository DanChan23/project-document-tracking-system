class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
  end
end
