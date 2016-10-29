# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(
    name: Faker::Company.name,
    website: Faker::Internet.url,
    address: <<-"EOA".chomp
      #{Faker::Address.street_address},
      #{Faker::Address.city},
      #{Faker::Address.state}
      #{Faker::Address.postcode}
EOA
)
User.create(
    name: Faker::Name.name,
    email: 'user@example.com',
    password: 'password',
    company: company
)
