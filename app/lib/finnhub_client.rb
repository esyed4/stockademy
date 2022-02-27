require 'httparty'

class FinnhubClient
  ACCESS_TOKEN = Rails.application.credentials.api_keys.finnhub_key
  BASE_URL = 'https://finnhub.io/api/v1'

  def stock_info(stock_symbol)
    query('stock/profile2', symbol: stock_symbol.upcase)
  end

  def current_price(stock_symbol)
    query('quote', symbol: stock_symbol.upcase)
  end

  private

  def query(api, params = {})
    params = params.merge(default_params).map { |key, value| "#{key}=#{value}" }
    url = "#{BASE_URL}/#{api}?#{params.join('&')}"

    response = HTTParty.get(url)
    JSON.parse(response.body)
  end

  def default_params
    { token: ACCESS_TOKEN }
  end

end
