class Occasion < ApplicationRecord
  has_many :product_occasions
  has_many :products, through: :product_occasions, dependent: :destroy
end
