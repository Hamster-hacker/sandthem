class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  validates :start_date, presence: true
end
