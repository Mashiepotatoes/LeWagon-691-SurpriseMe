class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :gift_session

  validates :rating, presence: true
end