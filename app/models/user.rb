class User < ActiveRecord::Base
  validates_presence_of :email, :password, :username
  validates_uniqueness_of :email

  has_secure_password validations: false

  has_many :dispensers
  has_many :messages
end