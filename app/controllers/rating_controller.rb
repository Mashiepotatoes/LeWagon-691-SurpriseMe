class RatingController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @product = Product.find(params[:product_id])
    @rating.product = @product
    @rating.recipient = current_user

    # average rating
    @product_ratings = Rating.where(params[:product_id])
    @average_rating = @product_ratings.sum / @product_ratings.count
    @product.average_rating = @average_rating

    if @rating.save && @product.save
      redirect_to new_review_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
