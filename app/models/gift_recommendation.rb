class GiftRecommendation < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :recipient, class_name: 'User'
end
