class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :address, presence: true, length: { minimum: 10 }
  # validates :birthday, presence: true

  has_many :friendships
  has_many :friends, through: :friendships
end
