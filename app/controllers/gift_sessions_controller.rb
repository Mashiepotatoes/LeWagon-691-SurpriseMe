class GiftSessionsController < ApplicationController
  def new
    @gift_session = GiftSession.new
  end

  def show
    @gift_session = GiftSession.find(params[:id])
    @disco_recommendations = @gift_session.recipient.recommended_products
    @disco_recommendations_curated = get_recommendations(@gift_session, @disco_recommendations)
  end

  def create
    @gift_session = GiftSession.new # current user id
    @gift_session.user = current_user # recipient id
    @gift_session.recipient = User.find(params[:recipient_id])
    @gift_session.occasion = Occasion.find(params[:gift_session][:occasion_id])
    @gift_session.budget = params[:gift_session][:budget] # user's slider value
    @gift_session.save

    redirect_to gift_session_path(@gift_session.id) if @gift_session.save
  end

  private

  def get_recommendations(gift_session, disco_recommendations)
    user_preferences = Answer.where(choice: "Yes").distinct.pluck(:subcategory) # get user_prefs where answer choice is yes for those subcats
    Product.curate(gift_session, disco_recommendations, user_preferences)
  end
end
