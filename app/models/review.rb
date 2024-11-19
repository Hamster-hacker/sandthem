class Review < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  validates :title, :description, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :user_id, uniqueness: { scope: :dream_id }
end
