class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :destroy

  scope :curate, -> { where("price < 50") }
end
