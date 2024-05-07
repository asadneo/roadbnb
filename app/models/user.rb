class User < ApplicationRecord
  # Associations
  has_many :cars, foreign_key: 'user_id', dependent: :destroy
  has_many :bookings, foreign_key: 'user_id', dependent: :destroy
  has_many :reviews, foreign_key: 'user_id', dependent: :destroy
  # Validations
  validates :first_name, :last_name, :type, :contact, :email, presence: true
end
