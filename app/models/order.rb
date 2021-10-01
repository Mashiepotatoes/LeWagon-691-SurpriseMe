class Order < ApplicationRecord
  has_many :gift_sessions, dependent: :destroy
  belongs_to :cart, optional: true
  belongs_to :user
  # has_many :gift_sessions, optional: true
  has_one :rating

  monetize :amount_cents
  scope :is_pending, -> {where(state: 'pending')}
  scope :is_paid, -> {where(state: 'paid')}
end
