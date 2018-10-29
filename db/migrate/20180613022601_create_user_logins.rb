class CreateUserLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :user_logins do |t|
      t.datetime :timestamp
      t.integer :user_id

      t.timestamps
    end
  end
end
