class Cart < ApplicationRecord

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_many :orders
end
