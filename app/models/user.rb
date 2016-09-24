class User < ApplicationRecord
  belongs_to :organisation
  has_many :reviews
  has_many :votes
end
