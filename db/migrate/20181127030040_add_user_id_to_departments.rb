class AddUserIdToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :user_id, :integer
  end
end
