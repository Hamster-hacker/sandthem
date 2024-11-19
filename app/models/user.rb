class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dreams, dependent: :destroy
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many :reviewed_dreams, through: :reviews, source: :dream
end
