# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating 5 valid restaurants....'

categories = %w[chinese italian japanese french belgian]

5.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.phone_number
  # randomise the categories
  category = categories.sample

  restaurant = Restaurant.create!(
    name: name,
    address: address,
    phone_number: phone_number,
    category: categories.sample
  )

  puts "Creating reviews..."

  5.times do
    rating = rand(0..5)
    content = Faker::Lorem.paragraph

    Review.create!(
      rating: rating,
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
  end
end

puts 'Finished!'
