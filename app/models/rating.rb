class Rating < ApplicationRecord
  belongs_to :orders
  belongs_to :recipient, class_name: "User"
  validates :rating, presence: true
end
