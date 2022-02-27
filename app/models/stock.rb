class Stock < ApplicationRecord
  has_many :orders
  has_many :holdings
end
