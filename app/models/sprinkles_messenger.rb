class SprinklesMessenger < ActiveRecord::Base
  has_one :dispenser, as: :dispensable
end