# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do ||
Company.create(
    name: Faker::Company.name,
    website: Faker::Internet.url,
    address: <<-"EOA".chomp
      #{Faker::Address.street_address},
      #{Faker::Address.city},
      #{Faker::Address.state}
      #{Faker::Address.postcode}
EOA
)
end

User.create(
    name: Faker::Name.name,
    email: 'user@example.com',
    password: 'password',
    company: Company.first
)

5.times do ||
  Client.create(
      name:    Faker::Name.name,
      email:   Faker::Internet.email,
      company: Company.first,
      address: <<-"EOA".chomp
        #{Faker::Address.street_address},
        #{Faker::Address.city},
        #{Faker::Address.state}
        #{Faker::Address.postcode},
  EOA
  )
end
