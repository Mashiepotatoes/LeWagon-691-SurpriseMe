class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.cart.line_items.update_all(status: false)
    mail = UserMailer.with(user: @user, gift_session: @gift_session, recipient: @recipient).sent_gift.deliver_now
    mail.deliver_now
    flash.notice = "Email has been sent to your friend"
  end
end
