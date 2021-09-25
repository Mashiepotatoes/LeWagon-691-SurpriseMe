class GiftSessionsController < ApplicationController
  def new
    @gift_session = GiftSession.new
  end

  def show
    @gift_session = GiftSession.find(params[:id])
  end

  def create
    @gift_session = GiftSession.new
    # current user id
    @gift_session.user = current_user
    # recipient id
    @gift_session.recipient = User.find(params[:recipient_id])
    @gift_session.budget = 100
    @gift_session.save
    @gift_session.gift_recommendations = get_recommendations(@gift_session)
    redirect_to gift_session_path(@gift_session.id) if @gift_session.save
    # call gift recommendation model
    # retrieve product name, price
  end

  # this method is for selecting gift recommendations via checkbox stimulus
  def update
    if gift_session.update(gift_params)
      redirect_to gift_sessions_path
    else
      render :edit
    end
  end

  def gift_params
    params.require(:gift_session).permit(:gift_session_id)
  end

  def get_recommendations(gift_session)
    products = Product.all.sample(3)
    # map through products
    products.map do |product|
      GiftRecommendation.create(product: product, gift_session: gift_session)
    end
  end
end
