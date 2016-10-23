class Significant < ActiveRecord::Base
  belongs_to :user
  belongs_to :dispenser
  validates_presence_of :phone, :name, :user_id
  validates_uniqueness_of :phone
end