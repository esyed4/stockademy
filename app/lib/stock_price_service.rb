class StockPriceService < StockService
  # query for price once -> over a set time period
  def current_price(stock)
    current_price = StockPrice.find_by(stock_id: stock.id)

    Rails.logger.info("#{stock.stock_symbol}: #{current_price.updated_at}, #{10.minutes.ago} ")
    return current_price unless current_price.nil? || current_price.updated_at <= 10.seconds.ago

    Rails.logger.info("Fetching #{stock.stock_symbol} price from finnhub")

    fetch_latest_price(stock)
  end

  def fetch_latest_price(stock)
    current_price = stock_client.current_price(stock.stock_symbol)

    if StockPrice.find_by(stock_id: stock.id).nil?
      create_stock_price(current_price, stock)
    else
      update_stock_price(current_price, stock)
    end
  end

  def create_stock_price(current_price, stock)
    StockPrice.create(
      stock_id: stock.id,
      current_price: current_price['c'],
      day_high_price: current_price['h'],
      day_low_price: current_price['l'],
      day_open_price: current_price['o'],
      previous_close_price: current_price['pc'],
      price_taken_at: current_price['t']
    )
  end

  def update_stock_price(current_price, stock)
    stock_price = StockPrice.find_by(stock_id: stock.id)

    stock_price.update(
      current_price: current_price['c'],
      day_high_price: current_price['h'],
      day_low_price: current_price['l'],
      day_open_price: current_price['o'],
      previous_close_price: current_price['pc'],
      price_taken_at: current_price['t'],
      updated_at: Time.now
    )

    Rails.logger.info("Updated: #{stock.stock_symbol}: #{stock_price.updated_at}, #{10.seconds.ago} ")

    stock_price
  end

end
