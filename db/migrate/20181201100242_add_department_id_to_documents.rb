class AddDepartmentIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :department_id, :integer
  end
end
