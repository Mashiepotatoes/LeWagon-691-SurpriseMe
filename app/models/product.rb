class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :line_items, dependent: :destroy
  monetize :price_cents
  has_many :orders, dependent: :destroy
  # scope :for_occasion, -> (occasion) {
    #   where(occasion: occasion)
    # }
    has_many :product_occasions
    has_many :occasions, through: :product_occasions
    has_many :ratings

  scope :less_than, -> (budget) {
    where("price_cents <= #{budget*100}")
  }

  # scope :long_title, -> { where("LENGTH(name) > 100") }
  # scope :no_price, -> { where(price: 0) }
  # scope :nil_price, -> { where(price: nil) }

  def self.curate(gift_session, disco_recommendations)
    disco_recommendations.less_than(gift_session.budget) # for_occasion(gift_session.occasion)
    binding.pry
  end
end
