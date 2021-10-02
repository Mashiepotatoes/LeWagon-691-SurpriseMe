class RatingController < ApplicationController
  def new
    @rating = Rating.new
    @product = Product.find(params[:product_id])
    flash[:alert] = "Your product rating will only help us give you better recommendations and will not be visible to the gifter"
  end

  def create
    @rating = Rating.new(rating_params)
    @product = Product.find(params[:rating].require(:product))
    @rating.product = @product
    @rating.user = current_user
    @rating.save!

    # average rating
    @product_ratings = Rating.where(product: @product)
    @average_rating = @product_ratings.map { |product| product["rating"] }.sum / @product_ratings.count
    @product.average_rating = @average_rating
    @product.save!

    if @rating.save! && @product.save!
      redirect_to received_path
      flash[:alert] = "Thank you for rating the product"
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
