class PaymentsController < ApplicationController
  def new
    @order = GiftSession.orders.where(state: 'pending').find(params[:order_id])
  end
end
