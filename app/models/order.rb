class Order < ApplicationRecord
  has_many :gift_sessions
  belongs_to :cart
  belongs_to :user
  monetize :amount_cents
  scope :is_pending, -> {where(state: 'pending')}
  scope :is_paid, -> {where(state: 'paid')}
end
