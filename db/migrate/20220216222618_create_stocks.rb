class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :stock_symbol
      t.string :company_name
      t.string :description
      t.string :currency
      t.string :country
      t.string :exchange
      t.string :ipo
      t.string :phone
      t.string :weburl
      t.string :logo
      t.string :industry

      t.timestamps
    end
  end
end
