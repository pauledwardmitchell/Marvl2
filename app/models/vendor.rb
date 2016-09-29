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

  def associate_category(category_name)
    category = Category.find_by name: category_name
    if category
      Offering.create vendor_id: self.id, category_id: category.id
    end

  end
end
