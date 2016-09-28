class Vendor < ApplicationRecord
  has_many :offerings
  has_many :categories, through: :offerings
  has_many :reviews

  def full_address
  	self.street_address + " " + self.city + " " + self.state + " " + self.zip_code.to_s
  end

  def avg_rating
    if self.reviews.count > 0
      self.reviews.map { |review| review.rating }.inject(0, :+) / self.reviews.count
    else
  	  "no ratings"
    end
  end
end
