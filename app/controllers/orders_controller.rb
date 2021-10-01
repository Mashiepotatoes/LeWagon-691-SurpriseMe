class OrdersController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @total = 0
    @cart.line_items.each do |item|
      @total += ((item.product.price * item.quantity).to_d * 1.07).to_d if item.status == true
    end

    @grand_total = @total + 15.0

    order = Order.create!(cart: @cart, amount: @grand_total, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'sgd',
          unit_amount: order.amount_cents,
          product_data: {
            name: "Your order ",
          }
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
  )
  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end

  def show
      # get the session for this order
      @gift_session = GiftSession.where(user: current_user).last
      @order = current_user.orders.find(params[:id])
      @gift_session.order = @order
      @gift_session.save

      flash[:notice] = "Email has been sent to your friend"
    # Find the gift session
    # @gift_session = GiftSession.find(params[:id])
    # Assign the created order to the gift session
    # @order = @gift_session.order.find(params[:id])
  end
end
