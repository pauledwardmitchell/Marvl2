class Location < ApplicationRecord
  belongs_to :organisation

  validates :name, uniqueness: true
  validates_associated :organisation


  def full_address
    self.street_address + ",   " + self.city + ", " + self.state + ", " + self.zip_code.to_s
  end

end
