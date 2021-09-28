class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :line_items, dependent: :destroy
  monetize :price_cents
  has_many :orders, dependent: :destroy
  has_many :product_occasions, dependent: :destroy
  has_many :ratings

  # scope :for_occasion, -> (occasion) {
  #   where(occasion: occasion)
  # }

  scope :less_than, ->(budget) {
    where("price < #{budget}")
  }

  scope :rating_filter, -> {
    where("average_rating > 3").or(where("average_rating = 0"))
  }

  scope :long_title, -> { where("LENGTH(name) > 100") }
  scope :no_price, -> { where(price: 0) }
  scope :nil_price, -> { where(price: nil) }

  def self.curate(gift_session, disco_recommendations)
    disco_recommendations.less_than(gift_session.budget).rating_filter.sample(5) # for_occasion(gift_session.occasion)
  end
end
