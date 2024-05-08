class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations
  has_many :cars, foreign_key: 'user_id', dependent: :destroy
  has_many :bookings, foreign_key: 'user_id', dependent: :destroy
  has_many :reviews, foreign_key: 'user_id', dependent: :destroy
  # Validations
  # validates :first_name, :last_name, :type_of_user, :contact, :email, presence: true
end
