class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :portfolio_id
      t.integer :stock_id
      t.integer :quantity
      t.decimal :price, precision: 6, scale: 2
      t.string :event_type

      t.timestamps
    end
  end
end
