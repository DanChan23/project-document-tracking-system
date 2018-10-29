json.extract! document_history, :id, :document_id, :received_by_name, :received_by_office, :received_from_name, :received_from_office, :length_of_stay, :remarks, :max_stay, :created_at, :updated_at
json.url document_history_url(document_history, format: :json)
