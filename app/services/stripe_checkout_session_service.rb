class StripeCheckoutSessionService
  def call(event)
    puts "======================"
    puts "Webhook hit"
    puts "======================"
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.cart.line_items.update_all(status: false)
  end
end
