Fabricator(:message) do 
  message { Faker::Lorem.paragraph(1) }
  emoji { ['joy', 'hope', 'fun', 'love'].sample }
end
