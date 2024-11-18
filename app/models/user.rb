class User < ApplicationRecord
  has_many :dreams, dependent: :destroy
  has_many :bookings
end
