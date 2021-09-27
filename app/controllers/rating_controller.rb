class RatingController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @product = Product.find(params[:product_id])
    @rating.product = @product
    @rating.save
  end
end
