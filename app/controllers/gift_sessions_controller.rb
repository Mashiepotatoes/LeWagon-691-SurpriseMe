class GiftSessionsController < ApplicationController
  def new
    @gift_session = GiftSession.new
  end

  def show
    @gift_session = GiftSession.find(params[:id])
    @disco_recommendations = @gift_session.recipient.recommended_products
    get_recommendations(@gift_session, @disco_recommendations)
  end

  def create
    @gift_session = GiftSession.new # current user id
    @gift_session.user = current_user # recipient id
    @gift_session.recipient = User.find(params[:recipient_id])
    @gift_session.occasion = "Christmas"
    @gift_session.budget = params[:gift_session][:budget]
    @gift_session.save
    raise

    redirect_to gift_session_path(@gift_session.id) if @gift_session.save
  end

  private

  def get_recommendations(gift_session, disco_recommendations)
    Product.curate(gift_session, disco_recommendations) # filter by price
  end
end
