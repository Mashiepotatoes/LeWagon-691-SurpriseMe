class Order < ApplicationRecord
  has_many :gift_sessions
  belongs_to :product
  belongs_to :cart
  belongs_to :user

  monetize :amount_cents
end
