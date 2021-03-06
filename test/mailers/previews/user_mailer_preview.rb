# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/sent_gift
  def sent_gift
    user = User.first
    UserMailer.with(user: user).sent_gift.deliver_now
  end
end
