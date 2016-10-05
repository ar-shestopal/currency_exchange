json.extract! exchange_rate, :id, :date, :rate, :created_at, :updated_at
json.url exchange_rate_url(exchange_rate, format: :json)