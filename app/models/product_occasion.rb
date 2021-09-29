class ProductOccasion < ApplicationRecord
  belongs_to :product
  belongs_to :occasion
end
