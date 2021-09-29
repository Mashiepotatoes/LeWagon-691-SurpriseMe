class OrdersController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @total = 0
    @cart.line_items.each do |item|
      @total += (item.product.price * item.quantity)
    end

    order = Order.create!(cart: @cart, amount: @total, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'sgd',
          unit_amount: order.amount_cents,
          product_data: {
            name: "Your order ",
            images: [@cart.products.first.image_url]
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
      @order = current_user.orders.find(params[:id])
    # Find the gift session
    # @gift_session = GiftSession.find(params[:id])
    # Assign the created order to the gift session
    # @order = @gift_session.order.find(params[:id])
  end
end
