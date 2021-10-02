class RatingController < ApplicationController
  def new
    @rating = Rating.new
    @product = Product.find(params[:product_id])

  end

  def create
    @rating = Rating.new(rating_params)
    @product = Product.find(params[:product_id])
    @rating.product = @product
    @rating.user = current_user
    @rating.save!

    # average rating
    @product_ratings = Rating.where(product_id: params[:product_id])
    @average_rating = @product_ratings.map { |product| product["rating"] }.sum / @product_ratings.count
    @product.average_rating = @average_rating
    @product.save!

    if @rating.save! && @product.save!
      redirect_to friendships_path
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
