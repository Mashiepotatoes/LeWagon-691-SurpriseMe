class ProductsController < ApplicationController
 

  def gift_received
    @recipient = current_user
    @received_gifts = Product.joins(carts: [orders: [:gift_sessions]])
      .where("state = 'paid' AND recipient_id = #{@recipient.id}" )
    # self.joins(carts: [orders: [:gift_sessions]])
    # .where(state: "paid",recipient_id: current_user )
  end
end
