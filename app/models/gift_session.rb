class GiftSession < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :recipient, class_name: 'User'
  has_many :gift_recommendations
  belongs_to :occasion
end
