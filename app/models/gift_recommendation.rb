class GiftRecommendation < ApplicationRecord
  belongs_to :product
  belongs_to :session

  # def get_recommendations(session)
  #   puts 'Hello'
  # end
end
