# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Space.destroy_all

User.create!(email: 'user1@example.com', password: 'password123')
User.create!(email: 'user2@example.com', password: 'password456')
User.create!(email: 'user3@example.com', password: 'password789')

require 'faker'
require 'open-uri'
puts "creating seed file..."

# url = ["https://images.unsplash.com/photo-1563714193017-5a5fb60bc02b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
#       "https://images.unsplash.com/photo-1612387290123-34af734b5f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80",
#       "https://images.unsplash.com/photo-1594886962861-1cbd2afd5fa6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
#     ]

urls = {
  garden: [
    "https://images.unsplash.com/photo-1563714193017-5a5fb60bc02b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "https://images.unsplash.com/photo-1612387290123-34af734b5f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80",
    "https://images.unsplash.com/photo-1594886962861-1cbd2afd5fa6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
  ],
  pool: [
    "https://images.unsplash.com/photo-1601560896164-834d6f61ea66?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80",
    "https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
    "https://images.unsplash.com/photo-1602774895672-b553538bceb9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"

  ],
  backyard: [
    "https://images.unsplash.com/photo-1560749003-f4b1e17e2dff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80",
    "https://images.unsplash.com/photo-1527359443443-84a48aec73d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YmFja3lhcmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1602860739945-9a61573cd62d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
  ],
  garage: [
    "https://images.unsplash.com/photo-1576172474782-567d7ca1975b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80",
    "https://images.unsplash.com/photo-1548343361-02248be15911?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGdhcmFnZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1619335680796-54f13b88c6ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
  ]
}

SPACE_TYPES = ["garden", "garage", "backyard", "pool"]

def create_new_space(url, user, space_type)
  file = URI.open(url)
  new_spaces = Space.new(
    capacity: Faker::Number.number(digits: 2),
    space_type: space_type,
    address: Faker::Address.full_address,
    title: "My beautiful #{space_type}",
    price: Faker::Number.number(digits: 3),
    user: user
  )
  new_spaces.photos.attach(io: file, filename: "van_My beautiful #{space_type}.jpg", content_type: "image/jpg")
  new_spaces.save!
end

urls.each do |space_type, urls_array|
  urls_array.each do |url|
    create_new_space(url, User.first, space_type)
  end
end

puts "finished seeding"
