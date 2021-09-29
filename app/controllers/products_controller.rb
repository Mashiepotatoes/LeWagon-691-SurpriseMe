class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def gift_received
     @received_gifts = Product.joins(carts: [orders: [:gift_sessions]])
    # .where("state = 'paid' AND recipient_id = #{self.id}" )

    # self.joins(carts: [orders: [:gift_sessions]])
    # .where(state: "paid",recipient_id: current_user )

  end
end
