require 'finnhub_client'

class StockService
  protected

  def stock_client
    @stock_client ||= FinnhubClient.new
  end
end
