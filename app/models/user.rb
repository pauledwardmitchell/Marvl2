class User < ApplicationRecord
  belongs_to :organisation
  has_many :reviews
  has_many :votes
  has_one :privacy
  has_and_belongs_to_many :roles

  has_secure_password

  validates :email, uniqueness: true
  validates :email, :first_name, :last_name, presence: true
  validates_associated :organisation
  validates_associated :roles

  def full_name
  	self.first_name + " " + self.last_name
  end

  def add_role(role_id)
    role = Role.find(role_id)
    self.roles << role
  end

  def is_admin?
    admin = Role.find_by name: 'Admin'
    self.roles.include? admin
  end


  def ambassador?
    ambassador = Role.find_by name: 'Ambassador'
    self.roles.include? ambassador
  end

  def member?
    member = Role.find_by name 'Member'
    self.roles.include? member
  end

  def date_format(expiration_date)
  	expiration_date.strftime("%m/%d/%y")
  end

end
