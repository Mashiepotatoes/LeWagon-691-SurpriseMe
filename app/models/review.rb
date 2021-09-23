class Review < ApplicationRecord
  belongs_to :order
  belongs_to :friendship
end
