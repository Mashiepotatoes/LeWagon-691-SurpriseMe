class GiftRecommendationsController < ApplicationController
  def index
    @product = Product.first
  end

  def new
    @session = Session.new
    @gift_recommendation.session = @session
  end
end
