json.extract! user, :id, :username, :fname, :lname, :email, :password_digest, :role_id, :user_id, :created_at, :updated_at
json.url user_url(user, format: :json)
