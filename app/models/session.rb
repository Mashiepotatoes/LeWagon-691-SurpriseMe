class Session < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :recipient, class_name: 'User'
end
