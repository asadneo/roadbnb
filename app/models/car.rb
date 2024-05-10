class Car < ApplicationRecord
  # Associations
  belongs_to :user, foreign_key: 'user_id'
  has_many :bookings, foreign_key: 'car_id', dependent: :destroy
  has_many :reviews, foreign_key: 'car_id', dependent: :destroy
  # Validations
  validates :make, :model, :year, :img_url, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
