class Occasion < ApplicationRecord
  has_many :product_occasions, dependent: :destroy
end
