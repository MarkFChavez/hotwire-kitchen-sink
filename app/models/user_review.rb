class UserReview < ApplicationRecord

  validates :author, :content, presence: true
  validates :rating, numericality: { in: 1..5 }

end
