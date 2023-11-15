# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Array of pizza names
pizza_names = [
  'Margherita',
  'Pepperoni',
  'Vegetarian',
  'Hawaiian',
  'Meat Lovers',
  'BBQ Chicken',
  'Mushroom and Olive',
  'Supreme',
  'White Pizza',
  'Buffalo Chicken',
  'Capricciosa',
  'Quattro Formaggi',
  'Pesto Chicken',
  'Veggie Delight',
  'Spinach and Feta',
  'Sausage and Mushroom',
  'Chicken Alfredo',
  'Taco Pizza',
  'Greek Pizza',
  'Bacon and Onion',
  'Artichoke and Tomato',
  'Truffle Mushroom',
  'Prosciutto and Arugula',
  'Barbecue Bacon',
  'Clam Pizza',
  'Fig and Gorgonzola',
  'Shrimp Scampi',
  'Broccoli and Cheddar',
  'Buffalo Ranch Chicken',
]

# Create 30 items for the Pizza menu with price
30.times do |i|
  Menu.create(name: pizza_names[i % pizza_names.length], price: rand(5.99..15.99))
end
