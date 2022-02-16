json.extract! stock, :id, :stock_symbol, :company_name, :description, :currency, :country, :exchange, :ipo, :phone, :weburl, :logo, :industry, :created_at, :updated_at
json.url stock_url(stock, format: :json)
