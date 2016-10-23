class Dispenser < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_one :significant
end

class SprinklesDispenser < Dispenser
end

class StoryDispenser < Dispenser
end