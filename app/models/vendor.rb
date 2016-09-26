class Vendor < ApplicationRecord
  has_many :offerings
  has_many :categories, through: :offerings
  has_many :reviews

  def full_address
  	self.street_address + " " + self.city + " " + self.state + " " + self.zip_code.to_s
  end
end
