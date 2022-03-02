require 'stock_search_service'

class StocksController < ApplicationController

  # GET /stocks or /stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1 or /stocks/1.json
  def show
    stock_populator = StockSearchService.new
    @stock_symbol = params[:id]
    @stock = stock_populator.stock_by_symbol(@stock_symbol)

    price_populator = StockPriceService.new
    @stock_price = price_populator.current_price(Stock.find_by(stock_symbol: @stock_symbol.upcase))
    @current_price = @stock_price.current_price
  end

  private

  # Only allow a list of trusted parameters through.
  def stock_params
    params.require(:stock).permit(:stock_symbol, :company_name, :description, :currency, :country, :exchange, :ipo, :phone, :weburl, :logo, :industry)
  end

end
