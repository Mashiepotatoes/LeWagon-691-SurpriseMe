class Rating < ApplicationRecord
  belongs_to :products
  belongs_to :recipients, class_name: "User"
  belongs_to :gift_sessions

  validates :rating, presence: true
end