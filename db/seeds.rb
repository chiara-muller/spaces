# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create!(email: 'user1@example.com', password: 'password123')
# User.create!(email: 'user2@example.com', password: 'password456')
# User.create!(email: 'user3@example.com', password: 'password789')

40.times do
  Space.create!(capacity: '600', space_type: "garden", address: "45, event st", title: "My beauiful place", price: '70')
end
