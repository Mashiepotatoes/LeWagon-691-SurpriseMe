class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: {minimum:1}
  validates :last_name, presence: true, length: {minimum:1}
  validates :address, presence: true, length: { minimum: 10 }
  validates :birthday, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_username,
    against: [ :username,:first_name,:last_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :response_sets
  has_many :answers, through: :response_sets
  has_many :questions, through: :response_sets
  has_one_attached :profile_photo
  has_many :orders
  has_many :ratings
  has_recommended :products

  def pending_orders
    self.orders.is_pending
  end

  def received_gifts
    @users_gifts = []
    @gift_sessions = GiftSession.where(recipient: self)
    @gift_sessions._select! do |session|
      session.order.state == "paid"
    end

    @gift_sessions.each do |session|
      if session.order != nil
        products = session.order.cart.products
        products.each { |product| @users_gifts << product }
      end
    end

    @users_gifts
  end

  def has_questions?
    @response_sets = ResponseSet.where(user: self)
    @question = Question.first
    @all_questions = Question.all
    @response_sets.nil? || (@response_sets.count != @all_questions.count) ? @quiz_landing = true : @quiz_landing = false
  end

  private

  def send_sent_gift_email
    UserMailer.with(user: self).sent_gift.deliver_now
  end
end
