class PaymentsController < ApplicationController
  def new
    @order = current_user.pending_orders.find(params[:order_id])
  end
end
