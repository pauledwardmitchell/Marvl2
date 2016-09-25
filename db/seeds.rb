Organisation.create!(name: "Silver Spring UMC")

Location.create!(name: "Main campus", street_address: "8900 Georgia Ave", city: "Silver Spring", state: "MD", zip_code: "20910", phone: "(301) 587-1215", organisation_id: "1")

Organisation.create!(name: "KIPP DC")

Location.create!(name: "KIPP DC AIM Academy: Douglass Campus", street_address: "2600 Douglass Road SE", city: "Washington", state: "DC", zip_code: "20020", phone: "202-678-5477", organisation_id: "2")

User.create!(first_name: "Coop", last_name: "Shop", email: "coop@shop.com", password: "password", organisation_id: 1, membership_expiration: "12/01/2016")