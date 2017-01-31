class Review < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
  has_many :votes

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true

end
