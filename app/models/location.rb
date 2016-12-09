class Location < ApplicationRecord
  belongs_to :organisation

  validates_associated :organisation
  validates :street_address, :city, :state, :zip_code, presence: true


  def full_address
    self.street_address + ",   " + self.city + ", " + self.state + ", " + self.zip_code.to_s
  end

end
