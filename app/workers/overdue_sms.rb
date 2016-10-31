class OverdueSMS
  include Sidekiq::Worker

  def perform
    send_overdue_messages
  end

  def send_overdue_messages
    sent_count = 0
    Dispenser.all.each do |dispenser|
      if !dispenser.delivery_time.nil? and dispenser.overdue?
        dispenser.send_next 
        sent_count += 1
        puts "#{dispenser.purpose_statement} sent a message."
      end
    end

    puts "Sent #{sent_count} overdue messages..."
  end
end
