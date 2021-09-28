class OrdersController < ApplicationController
  def create
    # Find the gift session
    @gift_session = GiftSession.find(params[:id])
    # Create the order
    # Create the order session
    # Redirect to new order payment path
  end

  def show
    # Find the gift session
    @gift_session = GiftSession.find(params[:id])
    # Assign the created order to the gift session
    @order = @gift_session.order.find(params[:id])
  end
end
