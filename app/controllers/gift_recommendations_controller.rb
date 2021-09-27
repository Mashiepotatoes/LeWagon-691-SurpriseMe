class GiftRecommendationsController < ApplicationController
  RECOMMENDATIONS_ARRAY = []

  def index
    @product = Product.first
  end

  def new
    @session = Session.new
    @gift_recommendation.session = @session
  end

  def rate
    RECOMMENDATIONS_ARRAY << {user_id: 1, item_id: 1}
  end

  def recommend
t return 5
  end

  def save_recommendation

  end
end
