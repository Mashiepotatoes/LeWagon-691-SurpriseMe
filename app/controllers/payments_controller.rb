class PaymentsController < ApplicationController
  def new
    @order = current_user.order
  end
end
