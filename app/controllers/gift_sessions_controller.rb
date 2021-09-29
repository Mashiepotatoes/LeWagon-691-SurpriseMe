class GiftSessionsController < ApplicationController
  def new
    @gift_session = GiftSession.new
  end

  def show
    @gift_session = GiftSession.find(params[:id])
  end

  def create
    @gift_session = GiftSession.new # current user id
    @gift_session.user = current_user # recipient id
    @gift_session.recipient = User.find(params[:recipient_id])
    @gift_session.budget = params[:gift_session][:budget]
    @gift_session.save
    # call gift recommendation model
    # retrieve product name, price
    @gift_session.gift_recommendations = get_recommendations(@gift_session)
    redirect_to gift_session_path(@gift_session.id) if @gift_session.save
  end

  def get_recommendations(gift_session)
    recommendations_array = Product.curate(gift_session) # filter by price
  #   recommender = Disco::Recommender.new
  #   # recommendations = format_results(recommendations_array,  gift_session)
  #   recommendations = ([
  #     {user_id: 1, item_id: 1, rating: 5},
  #     {user_id: 2, item_id: 1, rating: 5},
  #     {user_id: 1, item_id: 2, rating: 5},
  #     {user_id: 2, item_id: 2, rating: 5},
  #     {user_id: 1, item_id: 3, rating: 5},
  #     {user_id: 2, item_id: 3, rating: 5},
  #     {user_id: 1, item_id: 4, rating: 5},
  #     {user_id: 2, item_id: 4, rating: 5},
  #     {user_id: 1, item_id: 5, rating: 5},
  #     {user_id: 2, item_id: 5, rating: 5}
  # ])
  #   recommender.fit(recommendations)
  #   products = recommender.user_recs(current_user.id)
  #   products.map do |product|
  #     GiftRecommendation.create(product: product, gift_session: gift_session)
    # end
    recommendations_array.map do |product|
      GiftRecommendation.create(product: product, gift_session: gift_session)
    end

  end

  # def format_results(products)
  #   products.map do |product|
  #     {
  #       user_id: gift_session.recipient_id,
  #       item_id: product.id,
  #       rating: product.rating
  #     }
  #   end
  # end
end
