# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

URL = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts 'Cleaning up database...'
Ingredient.destroy_all

puts 'Seeding database...'

serialized_ingredients = open(URL).read
ingredients_attributes = JSON.parse(serialized_ingredients)
ingredients = ingredients_attributes['drinks']
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts "Created #{Ingredient.count} ingredient(s)"
puts 'Finished!'
