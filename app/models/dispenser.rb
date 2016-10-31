require 'twilio-ruby'

class Dispenser < ActiveRecord::Base
  validates_presence_of :purpose_statement
  belongs_to :user
  belongs_to :significant
  belongs_to :dispensable, polymorphic: true
  has_many :messages

  def start!
    set_delivery_time! if has_messages?
  end

  def started?
    !delivery_time.nil?
  end

  def set_delivery_time!
    update(delivery_time: next_delivery_time) ? true : false
  end

  def send_next
    if has_messages? and overdue?
      message = select_random_message
      if deliver_sms(message)
        set_delivery_time!
      end
    end
  end

  def sent_messages
    messages.where(sent: true)
  end

  def overdue?
    delivery_time < DateTime.now
  end

  def has_messages?
    messages.count > 0
  end

  private

  def select_random_message
    messages.where(sent: false).sample
  end

  def deliver_sms(message)
    client = Twilio::REST::Client.new(
      ENV['ACCOUNT_SID'],
      ENV['AUTH_TOKEN']
    )

    begin
      client.messages.create(
        to: significant.phone,
        from: "14255288374",
        body: message
      )
    rescue Twilio::REST::RequestError => e
      puts e.message
    end

    puts "Message sent to #{significant.phone}"
    message.update(sent: true)
  end

  def next_delivery_time
    offset_hour = 7 # don't send before offset
    messaging_hours = 12 # send between offset and end of range

    DateTime.now.change({ 
      day: DateTime.now.tomorrow.day, 
      hour: offset_hour + rand(messaging_hours),
      minute: rand(60)
    })
  end
end
