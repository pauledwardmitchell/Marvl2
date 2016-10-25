gmember = Role.create name: "Member"
admin = Role.create name: "Admin"
ambassador = Role.create name: "Ambassador"

cat_names = %w(Carpet/Flooring Doors Electrician Fire\ Alarm Hardscapes HVAC Insurance Kitchen Cleaning Painter Pest\ Control Pipe\ Organ\ Repair)
categories = cat_names.map {|name| Category.create name: name}

dbc = Organisation.create name: "Dev Bootcamp"
cpa = Organisation.create name: "Community Purchasing Alliance"

hubbard = Location.create name: "hubbard st", street_address: "531 W Hubbard St", city: "Chicago", state: "IL", zip_code: "60654", organisation_id: "1"
van_buren = Location.create name: "van buren", street_address: "1033 W Van Buren St", city: "Chicago", state: "IL", zip_code: "60607", organisation_id: "1"
cpa_location =  Location.create name: "cpa hq", street_address: "1226 Vermont Ave, NW, Suite 200", city: "Washington", state: "DC", zip_code: "20005", organisation_id: "2"

laur = User.create(first_name: "Laur", last_name: "Skelly", email: "laurieskelly@gmail.com", password: "321coopshop", organisation_id: dbc.id, membership_expiration: "2026/12/31")
paul = User.create(first_name: "Paul", last_name: "Mitchell", email: "pauledwardmitchell@gmail.com", password: "321coopshop", organisation_id: dbc.id, membership_expiration: "2026/12/31")
kaitlyn = User.create(first_name: "Kaitlyn", last_name: "Bradshaw", email: "kmbradshaw@gmail.com", password: "321coopshop", organisation_id: dbc.id, membership_expiration: "2026/12/31")
benedict = User.create(first_name: "Benedict", last_name: "Schurwanz", email: "benedictify@gmail.com", password: "321coopshop", organisation_id: dbc.id, membership_expiration: "2026/12/31")
felipe = User.create(first_name: "Felipe", last_name: "Witchger", email: "felipe@cpa.coop", password: "321coopshop", organisation_id: cpa.id, membership_expiration: "2026/12/31")
coop = User.create(first_name: "Coop", last_name: "Shop", email: "coop@shop.com", password: "password", organisation_id: cpa.id, membership_expiration: "2026/12/31")
fake = User.create(first_name: 'Fake', last_name: 'Member', email: 'fake@person.com', password: 'fakeperson', organisation_id: cpa.id)

[laur, paul, kaitlyn, benedict, felipe, coop, fake].each do |person|
  Privacy.create user_id: person.id
  unless person == fake
    person.add_role(admin.id)
  end
end


