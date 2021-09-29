class Occasion < ApplicationRecord
  has_many :product_occasions, dependent: :destroy
  has_many :products, through: :product_occasions
  has_many :gift_sessions, dependent: :destroy
end
