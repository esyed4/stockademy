class StockSearchService < StockService
  def stock_by_symbol(stock_symbol)
    stock = Stock.find_by(stock_symbol: stock_symbol.upcase)

    return stock unless stock.nil?

    Rails.logger.info("Fetching #{stock_symbol} from finnhub")
    fetch_and_create_stock_info(stock_symbol)
  end

  private

  def fetch_and_create_stock_info(stock_symbol)
    stock_info = stock_client.stock_info(stock_symbol)

    return {} if stock_info.empty?

    Stock.create(
      stock_symbol: stock_info['ticker'],
      company_name: stock_info['name'],
      currency: stock_info['currency'],
      country: stock_info['country'],
      exchange: stock_info['exchange'],
      ipo: stock_info['ipo'],
      phone: stock_info['phone'],
      logo: stock_info['logo'],
      weburl: stock_info['weburl'],
      industry: stock_info['finnhubIndustry']
    )
  end
end
