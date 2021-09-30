class ProductsController < ApplicationController

  def gift_received
    # create empty array called received_gifts
    @received_gifts = []
    # get all current sessions where user is recipient
    # GiftSession.where(recipient: User.find(4), order: {state: 'paid'})
    gift_session = GiftSession.where(recipient: current_user, order: {state: 'paid'})
    # go through each session and get that orders products
    gift_session.each do |session|
      products = session.order.cart.products
      products.each { |product| @received_gifts << product }
    end
    @received_gifts

  end
end
