class RatingController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @product = Product.find(params[:product_id])
    @rating.product = @product
    @rating.recipient = current_user

    if @review.save
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
