class User < ApplicationRecord
  belongs_to :organisation
  has_many :reviews
  has_many :votes

  has_secure_password

  def full_name
  	self.first_name + " " + self.last_name
  end
  
end
