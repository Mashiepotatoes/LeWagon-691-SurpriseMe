class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :line_items
  has_many :carts, through: :line_items

  monetize :price_cents

  belongs_to :orders, dependent: :destroy
#   has_many :orders, dependent: :destroy
  has_many :product_occasions, dependent: :destroy
  has_many :occasions, through: :product_occasions

  scope :for_occasion, ->(occasion_id) {
    joins(:occasions).where("occasion_id = #{occasion_id}")
  }

  has_many :ratings

  scope :less_than, -> (budget) {
    where("price_cents <= #{budget*100}")
  }

  scope :rating_filter, -> {
    where("average_rating > 3").or(where("average_rating = 0"))
  }

  scope :long_title, -> { where("LENGTH(name) > 100") }
  scope :no_price, -> { where(price: 0) }
  scope :nil_price, -> { where(price: nil) }
  scope :curated, ->(gift_session, disco_recommendations) { curate(gift_session, disco_recommendations)}

  def self.curate(gift_session, disco_recommendations)
    disco_recommendations.for_occasion(gift_session.occasion_id).less_than(gift_session.budget).rating_filter.sample(5) # for_occasion(gift_session.occasion)
  end


end
