class Vendor < ApplicationRecord
  has_many :offerings
  has_many :categories, through: :offerings
  has_many :reviews
end
