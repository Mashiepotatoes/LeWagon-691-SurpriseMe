class Order < ApplicationRecord
  # has_many :gift_sessions, optional: true
  belongs_to :cart
  belongs_to :user

  monetize :amount_cents
end
