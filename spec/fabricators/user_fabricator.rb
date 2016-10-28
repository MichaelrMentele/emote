Fabricator(:user) do 
  email { Faker::Internet.email }
  phone { Faker::Number.number(10) }
  password 'password'
  username { Faker::Name.name }
end
