class CreateDocumentHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :document_histories do |t|
      t.integer :document_id
      t.integer :received_by_name
      t.integer :received_by_office
      t.integer :received_from_name
      t.integer :received_from_office
      t.integer :length_of_stay
      t.string :remarks
      t.integer :max_stay

      t.timestamps
    end
  end
end
