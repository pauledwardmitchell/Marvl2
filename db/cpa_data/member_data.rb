require 'CSV'


# # # ORGS & LOCATIONS
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
  unless entry[:LegalName].strip == orgname
    # # find or create the organization in the db
    orgname = entry[:LegalName].strip
    org = Organisation.find_or_create_by name: orgname
    orgid = org.id
  end

  # LOCATION
  
  loc = {
    name: entry[:LocationName],
    street_address: entry[:Address],
    city: entry[:City],
    state: entry[:State],
    zip_code: entry[:Zip],
    organisation_id: orgid
  }
  begin
    Location.create! loc
  rescue ActiveRecord::RecordInvalid
    invalid += 1
    puts "Record creation failed (location probably already exists). \n#{loc}"
  end
end



# # # PEOPLE 
member_role_id = Role.find_by(name: "Member").id
people_data = CSV.read('db/cpa_data/members.csv')
people_headers = people_data.shift.collect {|h| h.to_sym}

invalid_people = 0
people_data.each do |row|

  person = people_headers.zip(row).to_h
  unless User.find_by email: person[:Email] 
    # find their org
    person_org = Organisation.find_by(name: person[:LegalName]).id

    # make their temporary password
    first_lower = person[:FirstName].downcase
    temporary_password = "#{first_lower},changeyourpassword!"

    new_user = {
      title: person[:Role],
      first_name: person[:FirstName],
      last_name: person[:LastName],
      email: person[:Email], 
      password: temporary_password,
      organisation_id: person_org
    }
    begin
      user = User.create! new_user
    rescue ActiveRecord::RecordInvalid
      invalid_people += 1
      puts "Record creation failed: \n#{new_user}"
    end
    if user
      Privacy.create user_id: user.id
      user.add_role(member_role_id)
    end
  end

end


puts "number of invalid location rows: #{invalid}"
puts "number of invalid person rows: #{invalid_people}"