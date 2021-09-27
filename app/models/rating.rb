class Rating < ApplicationRecord
  belongs_to :orders
  validates :rating, presence: true
end
