class Car < ApplicationRecord
  # Associations
  belongs_to :user, foreign_key: 'user_id'
  has_many :bookings, foreign_key: 'car_id', dependent: :destroy
  has_many :reviews, foreign_key: 'car_id', dependent: :destroy
  has_many :car_images, dependent: :destroy

  # Nested attributes for car images
  accepts_nested_attributes_for :car_images, allow_destroy: true

  # Validations
  validates :make, :model, :year, presence: true

  # PgSearch
  include PgSearch::Model
  pg_search_scope :search_by_make_model_year_description,
                  against: [:make, :model, :year, :description],
                  using: {
                    tsearch: { prefix: true }
                  }

  # Main Image
  def main_image
    car_images.first&.image.presence || "default_image_url.jpg"
  end
end
