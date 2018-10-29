json.extract! document, :id, :subject, :status, :date_created, :time_created, :created_at, :updated_at
json.url document_url(document, format: :json)
