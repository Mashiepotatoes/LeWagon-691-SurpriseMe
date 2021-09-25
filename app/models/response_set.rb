class ResponseSet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :answer
  belongs_to :question, dependent: :destroy
end
