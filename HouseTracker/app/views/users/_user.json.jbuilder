json.extract! user, :id, :user_name, :email_address, :phone_number, :created_at, :updated_at
json.url user_url(user, format: :json)
