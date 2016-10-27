# task :send_messages => :environment do 
#   User.all.each do |user|
#     user.dispensers.each do |dispenser|
#       if dispenser.dispensable
#         dispenser.dispensable.deliver_sms
#       end
#     end
#   end
# end