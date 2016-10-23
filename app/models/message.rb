class Message < ActiveRecord::Base
  validates_presence_of :message

  belongs_to :user
  belongs_to :dispenser

  after_initialize :set_default_values
  
  def set_default_values
    sent ||= false
  end
end