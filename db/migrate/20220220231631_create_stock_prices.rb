class CreateStockPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_prices do |t|
      t.integer :stock_id
      t.decimal :current_price, precision: 6, scale: 2
      t.decimal :day_high_price, precision: 6, scale: 2
      t.decimal :day_low_price, precision: 6, scale: 2
      t.decimal :day_open_price, precision: 6, scale: 2
      t.decimal :previous_close_price, precision: 6, scale: 2
      t.datetime :price_taken_at

      t.timestamps
    end
  end
end
