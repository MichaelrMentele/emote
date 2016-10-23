class Message < ActiveRecord::Base
  validates_presence_of :message

  belongs_to :user
  belongs_to :dispenser

  after_initialize :set_default_values
  
  def set_default_values
    sent ||= false
  end

  def emotion
    mapping = { 
      joy: 'joyful',
      hope: 'hopeful',
      fun: 'playful',
      love: 'loving'
    }.with_indifferent_access[emoji].capitalize
  end

  def to_s
    message
  end
end