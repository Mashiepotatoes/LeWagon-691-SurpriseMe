class Order < ApplicationRecord
  has_many :gift_sessions, optional: true
end
