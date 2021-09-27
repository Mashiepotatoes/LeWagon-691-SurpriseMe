class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  scope :less_than, -> (budget) {
    where("price < #{budget}")
  }

  scope :long_title, -> { where("LENGTH(name) > 100") 
  scope :no_price, -> { where(price: 0) }
  scope :nil_price, -> { where(price: nil) }

  def self.curate(gift_session)
    results = self.all.sample(5)  # .less_than(gift_session.budget)
  end

  def rating
    4.5
  end
end
