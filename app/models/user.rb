class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :organisation
  has_many :reviews
  has_many :votes
  has_one :privacy
  has_and_belongs_to_many :roles
  has_many :documents
  has_many :posts

#  has_secure_password
  
  validates :email, uniqueness: true
  validates :email, presence: true
#  validates :first_name, :last_name, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
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
    member = Role.find_by name: 'Member'
    self.roles.include? member
  end

  def pending?
    self.roles.length == 0
  end

  def date_format(expiration_date)
  	expiration_date.strftime("%m/%d/%y")
  end

  def location
    Location.find_by organisation_id: self.organisation.id
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now
    self.save!

    #UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    while User.exists?(column => self[column])
      self[column] = SecureRandom.urlsafe_base64
    end 
  end



end
