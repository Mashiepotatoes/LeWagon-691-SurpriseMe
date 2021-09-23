class GiftRecommendation < ApplicationRecord
  belongs_to :product
  belongs_to :session
end
