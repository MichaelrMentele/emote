Fabricator(:significant) do 
  name { Faker::Lorem.name }
  phone { Faker::Number.number(10) }
end