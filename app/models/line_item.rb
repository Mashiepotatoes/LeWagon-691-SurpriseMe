class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  scope :pending, -> { where(status: true) }
end
