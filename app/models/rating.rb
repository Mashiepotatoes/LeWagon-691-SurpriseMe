class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :rating, presence: true
end