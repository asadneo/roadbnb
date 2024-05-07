class Review < ApplicationRecord
  # Associations
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :car, foreign_key: 'car_id'
  # Validations
  validates :comment, presence: true
end
