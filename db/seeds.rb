# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Start seeding"
Hero.create([
  { name: "Clark Kent", super_name: "Superman" },
  { name: "Bruce Wayne", super_name: "Batman" },
  { name: "Diana Prince", super_name: "Wonder Woman" }
])

Power.create([
  { name: "Super Strength", description: "Grants incredible physical power" },
  { name: "Flight", description: "Allows the user to fly through the air" },
  { name: "Invisibility", description: "Enables the user to become invisible" }
])

# Then, create some hero_powers associations with valid strength values
HeroPower.create([
  { strength: "Strong", hero_id: 1, power_id: 1 },
  { strength: "Weak", hero_id: 1, power_id: 2 },
  { strength: "Average", hero_id: 2, power_id: 2 },
])
puts "Done seeding"