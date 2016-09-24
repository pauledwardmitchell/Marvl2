class Vendor < ApplicationRecord
  has_many :services
  has_many :categories, through: :services
  has_many :reviews
end
