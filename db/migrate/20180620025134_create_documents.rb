class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :subject
      t.string :status
      t.date :date_created
      t.time :time_created

      t.timestamps
    end
  end
end
