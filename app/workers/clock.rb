require File.expand_path('../../../config/boot',        __FILE__)
require File.expand_path('../../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

handler do |job|
  binding.pry
  puts "Running #{job}"
end

every(30.seconds, 'overdue_sms') do 
  OverdueSMS.perform_async
end
