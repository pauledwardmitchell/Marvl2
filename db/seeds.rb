
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

organisation = Organisation.create!(name: "Silver Spring UMC")
organisation_two = Organisation.create!(name: "KIPP DC")
organisations = [organisation, organisation_two]
organisations << Organisation.create(name: "E. L. Haynes Public Charter School")


Location.create(name: "Main campus", street_address: "8900 Georgia Ave", city: "Silver Spring", state: "MD", zip_code: "20910", phone: "(301) 587-1215", organisation_id: "1")
Location.create(name: "KIPP DC AIM Academy: Douglass Campus", street_address: "2600 Douglass Road SE", city: "Washington", state: "DC", zip_code: "20020", phone: "202-678-5477", organisation_id: "2")
Location.create(name: "E. L. Haynes Public Charter Elementary School", street_address: "4501 Kansas Avenue, NW", city: "Washington", state: "DC", zip_code: "20011", phone: "(202) 667-4446)", organisation_id: "3")

coop = User.create(first_name: "Coop", last_name: "Shop", email: "coop@shop.com", password: "password", organisation_id: organisation.id, membership_expiration: "12/01/2026")
fake = User.create(first_name: 'Fake', last_name: 'Member', email: 'fake@person.com', password: 'fakeperson', organisation_id: organisation_two.id)

Privacy.create(user_id: coop.id)
Privacy.create(user_id: fake.id)

member = Role.create name: "Member"
admin = Role.create name: "Admin"
ambassador = Role.create name: "Ambassador"

coop.add_role(admin.id)
coop.status = "ready_to_party"
fake.add_role(member.id)

30.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password)
  user.organisation_id = organisations[rand(0..2)].id
  if user.save
    user.add_role(member.id)
    user.status = 'ready_to_party'
    Privacy.create(user_id: user.id)
  end
end

vendors = []
10.times do
  vendors << Vendor.create(name: Faker::Company.name, street_address: "8900 Georgia Ave", city: "Silver Spring", state: "MD", zip_code: "20910", phone: "(301) 555-1215")
end


50.times do
  Review.create(title: "Review Title " + rand(1..1000).to_s, content: "Jean shorts PBR&B meggings kogi austin. Edison bulb cliche tbh franzen, typewriter polaroid man braid distillery ethical selfies migas humblebrag 8-bit +1 pickled.", rating: rand(1..5), vendor_id: rand(1..10), user_id: rand(3..32))
end

cat_names = %w(Carpet/Flooring Doors Electrician Fire\ Alarm Hardscapes HVAC Insurance Kitchen Cleaning Painter Pest\ Control Pipe\ Organ\ Repair)
categories = cat_names.map {|name| Category.create name: name}

30.times do
  vendor_index = rand(0..9)
  vendor_id = vendors[vendor_index].id
  category_index = rand(0..10)
  category_id = categories[category_index].id

  Offering.create!(vendor_id: vendor_id, category_id: category_id)
end

