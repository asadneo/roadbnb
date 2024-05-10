class Car < ApplicationRecord
  # Associations
  belongs_to :user, foreign_key: 'user_id'
  has_many :bookings, foreign_key: 'car_id', dependent: :destroy
  has_many :reviews, foreign_key: 'car_id', dependent: :destroy
  # Validations
  validates :make, :model, :year, :img_url, presence: true

  # PgSearch
  include PgSearch::Model
  pg_search_scope :search_by_make_model_year,
                  against: [:make, :model, :year],
                  using: {
                    tsearch: { prefix: true }
                  }
end
