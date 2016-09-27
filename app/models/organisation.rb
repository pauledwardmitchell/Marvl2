class Organisation < ApplicationRecord
  has_many :users
  has_many :locations
  has_many :documents, through: :users
end
