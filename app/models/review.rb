class Review < ApplicationRecord
  belongs_to :restaurant
  RATINGS = [0, 1, 2, 3, 4, 5]
  validates :content, presence: true
  validates :rating, inclusion: { in: RATINGS, message: '%{value} is not included in the list' }, numericality: true
end
