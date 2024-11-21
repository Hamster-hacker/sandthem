# rubocop:disable Naming/PredicateName
# rubocop:disable Layout/ArgumentAlignment
class Dream < ApplicationRecord
  has_one_attached :photo

  belongs_to :user

  has_many :users, through: :bookings
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews, source: :user

  CATEGORIES = ["Adventure", "Fantasy", "Mystery", "Romance", "Horror", "Sci-Fi", "Comedy"]

  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true
  validates :category, presence: true, allow_blank: true
  validates :category, inclusion: { in: CATEGORIES, message: " invalid. Please select a valid category" }
  validates :price, presence: { message: " can't be blank" }
  # validates :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :duration, numericality: { only_integer: true, greater_than: 0, message: " must be a valid number" }

  def is_owner?(user)
    self.user == user
  end
  include PgSearch::Model
  pg_search_scope :global_search,
  against: %i[title category description], using: {
    tsearch: { prefix: true }
  }
end
# rubocop:enable Naming/PredicateName
# rubocop:enable Layout/ArgumentAlignment
