class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def sent_gift
    @user = params[:user]
    @gift_session = GiftSession.where(user: @user).last
    @recipient = @gift_session.recipient
    mail(to: @recipient.email, subject: 'SurpriseMe!')
  end
end
