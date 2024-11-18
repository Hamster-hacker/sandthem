class Dream < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings

  has_many :bookings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true
  validates :category, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, numericality: { only_integer: true, greater_than: 0 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }


  CATEGORIES = ["Adventure", "Fantasy", "Mystery", "Romance", "Horror", "Sci-Fi", "Comedy"]

  # Validate that the category is included in the list
  validates :category, inclusion: { in: CATEGORIES}
end
