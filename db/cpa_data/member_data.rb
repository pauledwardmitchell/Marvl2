require 'CSV'

locations_data = CSV.read('db/cpa_data/locations_with_zip.csv')
headers = locations_data.shift.collect {|h| h.to_sym}

# var to persist name of organisation from row to row to reduce db lookups
orgname = ''
invalid = 0

# start loop
locations_data.each do |row|
  # make a hash so we're not effing with integer indices
  entry = headers.zip(row).to_h

  # ORG
  # if this is the same org as last time just skip to the location
  unless entry[:LegalName] == orgname
    # # find or create the organization in the db
    orgname = entry[:LegalName]
    org = Organisation.find_or_create_by name: orgname
    orgid = org.id
  end

  # LOCATION
  begin
    loc = {
      name: entry[:LocationName],
      street_address: entry[:Address],
      city: entry[:City],
      state: entry[:State],
      zip_code: entry[:Zip],
      organisation_id: orgid
    }
    Location.create! loc
  rescue ActiveRecord::RecordInvalid
    invalid += 1
    puts "Record creation failed (location probably already exists). \n#{loc}"
  end
end

puts "number of invalid rows: #{invalid}"
# people_data = CSV.read('db/cpa_data/members.csv')

# headers = people_data.shift

