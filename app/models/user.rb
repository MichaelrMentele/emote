class User < ActiveRecord::Base
  validates_presence_of :email, :phone, :password, :username
  validates_uniqueness_of :email, :phone

  has_secure_password validations: false

  has_many :dispensers
  has_many :messages
  has_many :significants
end