class Order < ApplicationRecord
  has_many :gift_sessions
  belongs_to :cart
  belongs_to :user
  belongs_to :product
  monetize :amount_cents
  scope :is_pending, -> {where(state: 'pending')}
end
