class Significant < ActiveRecord::Base
  belongs_to :user
  has_many :dispensers
  validates_presence_of :phone, :name, :user_id
end