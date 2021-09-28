class GiftRecommendation < ApplicationRecord
  belongs_to :product
  belongs_to :gift_session

end
