json.extract! user_login, :id, :timestamp, :user_id, :created_at, :updated_at
json.url user_login_url(user_login, format: :json)
