class CarImage < ApplicationRecord
  belongs_to :car
  validates :image, presence: true
end
