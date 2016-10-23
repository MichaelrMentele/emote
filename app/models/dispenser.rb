class Dispenser < ActiveRecord::Base
  validates_presence_of :purpose_statement
  belongs_to :user
  belongs_to :significant
  belongs_to :dispensable, polymorphic: true
  has_many :messages
end
