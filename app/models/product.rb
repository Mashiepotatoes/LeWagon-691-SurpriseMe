class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :ratings

  scope :occasion, -> (occasion) {
    where("occasion = #{occasion}")
  }

  scope :less_than, -> (budget) {
    where("price < #{budget}")
  }

  scope :rating_filter, -> {
    where("rating > 3").or(where("rating = 0"))
  }

  scope :long_title, -> { where("LENGTH(name) > 100") }
  scope :no_price, -> { where(price: 0) }
  scope :nil_price, -> { where(price: nil) }

  def self.curate(gift_session)
    self.occasion(gift_session.occasion).less_than(gift_session.budget).rating_filter.sample(5)
  end
end
