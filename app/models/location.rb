class Location < ApplicationRecord
  belongs_to :organisation

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    self.street_address + ",   " + self.city + ", " + self.state + ", " + self.zip_code.to_s
  end

  def info_window_link
    "<a href='/locations/" + self.id.to_s + "'>" + self.name + "</a>"
  end

end

###IF THERE ARE LOCATIONS WITHOUT GEOCODE - RUN THIS IN CONSOLE:
# Location.all.each do |l|
#   if l.latitude == nil
#     l.geocode
#     l.save
#   end
# end
