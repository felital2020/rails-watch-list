# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
Movie.destroy_all

10.times do
  Movie.create(title: Faker::Movie.title, overview: Faker::Movie.quote, poster_url:"https//source.unsplash.com/random", rating: rand(0..5))
end
