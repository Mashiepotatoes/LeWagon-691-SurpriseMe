class Order < ApplicationRecord
  has_many :gift_sessions
  belongs_to :cart
  belongs_to :user
  # has_many :gift_sessions, optional: true
  has_one :rating
  belongs_to :product
  monetize :amount_cents
  scope :is_pending, -> {where(state: 'pending')}
end
