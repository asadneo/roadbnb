class Booking < ApplicationRecord
  # Associations
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :car, foreign_key: 'car_id'
  # Validations
  validates :date, presence: true
end
