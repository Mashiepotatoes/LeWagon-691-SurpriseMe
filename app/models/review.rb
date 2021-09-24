class Review < ApplicationRecord
  belongs_to :order
  belongs_to :friendship
  belongs_to :user
end
