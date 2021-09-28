class Order < ApplicationRecord

  # has_many :gift_sessions, optional: true
  belongs_to :cart
  belongs_to :user

  monetize :amount_cents

#   has_many :gift_sessions, optional: true
#   has_one :rating
#   belongs_to :product

end
