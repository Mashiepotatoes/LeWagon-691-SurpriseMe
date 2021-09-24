class GiftRecommendationsController < ApplicationController
  def index
    # @product = Product.first
    # @gift_recommendation.product = product
    @gift_recommendations = Gift_recommendation.all
  end

  def show
  end

  def new
    @session = Session.new
    @gift_recommendation.session = @session
  end
end
