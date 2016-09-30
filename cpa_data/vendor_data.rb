require 'csv'

DATA_FILENAME = 'cpa_data/vendors_reviews.csv'
HEADER_ROW = 2
FIRST_RECORD = 3 # 'default' or an integer

data = CSV.read(DATA_FILENAME)

headers = data[HEADER_ROW].map {|h| h.downcase}
headers[5] = 'vendor_email'
last_record = data.length
first_record = FIRST_RECORD

records = data[first_record..last_record]

records.each do |record|
  row = headers.zip(record).to_h
  row['category'].sub(' / ','/')

  vend = Vendor.create name: row['company'], phone: row['phone'], email: row['vendor_email']
  cat = Category.find_or_create_by name: row['category']
  vend.associate_category(cat)

  org = Organisation.find_or_create_by name: row['organization']

  user = User.find_or_create_by email: row['email']
  review = Review.create content: row['why recommended'], rating: (rand(1..2)==2 ? 5 : 4)
  vend.reviews << review
  user.reviews << review

end

