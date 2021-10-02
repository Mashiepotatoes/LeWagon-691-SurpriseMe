class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :line_items, dependent: :destroy
  has_many :carts, through: :line_items

  monetize :price_cents

  has_many :product_occasions, dependent: :destroy
  has_many :occasions, through: :product_occasions

  scope :for_occasion, ->(occasion_id) {
    joins(:occasions).where("occasion_id = #{occasion_id}")
  }

  scope :less_than, ->(budget) {
    where("price_cents <= #{budget * 100}")
  }

  scope :by_category, ->(user_preferences) {
    where({subcategory: user_preferences})
  }

  def self.curate(gift_session, disco_recommendations, user_preferences)
    Product.all.sample(5)
  end
end
