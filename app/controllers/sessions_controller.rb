class SessionsController < ApplicationController
  def new
    @session = Session.new
    @product = Product.first
  end

  def show
    @session = Session.find(params[:id])
  end

  def create
    @session = Session.new
    # current user id
    @session.user = current_user
    # recipient id
    @session.recipient = User.find(params[:recipient_id])
    @session.budget = 100
    @session.save
    @session.gift_recommendations = get_recommendations(@session)
    redirect_to session_path(@session.id) if @session.save
    # call gift recommendation model
    # retrieve product name, price
  end

  def get_recommendations(session)
    products = Product.all.sample(3)
    # map through products
    products.map do |product|
      GiftRecommendation.create(product: product, session: session)
    end
  end
end
