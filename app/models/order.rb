class Order < ApplicationRecord
  has_many :gift_sessions
  belongs_to :product
end
