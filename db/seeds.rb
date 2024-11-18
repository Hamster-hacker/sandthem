# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning up database..."
User.destroy_all
Dream.destroy_all
puts "Database cleaned!"

# Create users
puts "Creating users..."
user1 = User.create!(username: "DreamSeeker1")
user2 = User.create!(username: "NightOwl22")
user3 = User.create!(username: "LucidDreamer")
puts "Users created successfully!"

dreams = [
  {
    title: "Flying Over a Luminous City",
    description: "Soaring above a vibrant cityscape at twilight, the buildings are glowing with an otherworldly light. You feel completely free, with a gentle breeze against your face as you explore the skies.",
    category: "Adventure",
    image_url: "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 49.99,
    duration: 30,
    rating: 4.8,
    user_id: user1.id
  },
  {
    title: "Exploring an Enchanted Forest",
    description: "Wander through a mystical forest filled with glowing flora and friendly woodland creatures. The air is filled with the scent of pine and magic.",
    category: "Fantasy",
    image_url: "https://images.unsplash.com/photo-1547140741-00d6fd251528?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 39.99,
    duration: 45,
    rating: 4.6,
    user_id: user2.id

  },
  {
    title: "Diving with Bioluminescent Sea Creatures",
    description: "Plunge into the depths of an ocean where glowing creatures of all shapes and sizes swim around you, illuminating the dark waters. Feel the calm embrace of the sea as you explore hidden wonders.",
    category: "Adventure",
    image_url: "https://images.unsplash.com/photo-1520302659201-7ecf4ae863d0?q=80&w=1786&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 59.99,
    duration: 60,
    rating: 4.9,
    user_id: user3.id

  },
  {
    title: "Attending a Magical Masquerade Ball",
    description: "Step into a grand ballroom filled with masked dancers, live orchestras, and endless elegance. The atmosphere is brimming with mystery, romance, and enchantment.",
    category: "Romance",
    image_url: "https://i.pinimg.com/originals/36/ab/17/36ab1765331035d72cb27a6d7f154a1c.jpg",
    price: 35.99,
    duration: 50,
    rating: 4.7,
    user_id: user2.id

  },
  {
    title: "Traveling Through Time to Ancient Egypt",
    description: "Journey back to the time of pharaohs and pyramids. Explore ancient temples and unravel the mysteries of a bygone civilization under the golden desert sun.",
    category: "History",
    image_url: "https://images.unsplash.com/photo-1648139210431-f5a62bc3f126?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 55.00,
    duration: 40,
    rating: 4.5,
    user_id: user3.id

  }
]

Dream.create!(dreams)

puts "Dreams created successfully!"
