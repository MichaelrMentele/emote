Fabricator(:sprinkles_messenger) do 
  frequency { Faker::Number.number(1) }
  period { Faker::Number.number(1) }
end