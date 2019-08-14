# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
10.times do
  user = User.create!(email: Faker::Internet.unique.email, description: Faker::TvShows::HowIMetYourMother.quote, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, encrypted_password:Faker::Number.number(digits: 7))
end

10.times do
  attendance = Attendance.create!(strip_customer_id: rand(1..10), user_id: rand(1..10), event_id: rand(1..10))
end

10.times do
	event = Event.create!(start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), duration: 5*rand(5..20), title: Faker::Book.title, event_description: Faker::TvShows::HowIMetYourMother.quote, price: Faker::Number.number(digits: 4), location: Faker::Address.city, user_id: rand(1..10))
end

puts "VITA OOO!!"