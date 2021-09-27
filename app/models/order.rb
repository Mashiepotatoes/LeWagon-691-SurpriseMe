class Order < ApplicationRecord
  has_many :gift_sessions, optional: true
  has_one :rating
  belongs_to :product
end
