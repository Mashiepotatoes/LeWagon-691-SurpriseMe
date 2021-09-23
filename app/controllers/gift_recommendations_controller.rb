class GiftRecommendationsController < ApplicationController
  def index
    # @product = Product.first
    # @gift_recommendation.product = product
    @gift_recommendations = Gift_recommendation.all
  end

  def new
    @session = Session.find(params[:session_id])
    @gift_recommendation.session = @session
    binding.pry
  end
end
