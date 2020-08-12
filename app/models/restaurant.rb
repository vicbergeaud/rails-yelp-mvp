class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORYTYPES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORYTYPES, message: '%{value} is not included in the list' }
 
  def average_rating
    sum = 0
    count = 0
  	self.reviews.each do |review|
  	  sum += review.rating
  	  count += 1
  	end
  	sum.fdiv(count)
  end



end
