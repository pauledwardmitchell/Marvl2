class Vendor < ApplicationRecord
  has_many :services
  has_many :categories, through: :services
  has_many :reviews

  def full_address
  	self.street_address + " " + self.city + " " + self.state + " " + self.zip_code.to_s
  end
end
