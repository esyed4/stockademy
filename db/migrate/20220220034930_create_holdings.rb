class CreateHoldings < ActiveRecord::Migration[7.0]
  def change
    create_table :holdings do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.integer :total_quantity
      t.decimal :average_value, precision: 6, scale: 2

      t.timestamps
    end
  end
end
