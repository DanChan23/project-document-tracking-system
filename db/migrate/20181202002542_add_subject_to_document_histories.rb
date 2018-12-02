class AddSubjectToDocumentHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :document_histories, :subject, :string
  end
end
