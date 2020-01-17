# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do |index|
  Product.create!(
      name: "#{Faker::Dessert.flavor} #{Faker::Dessert.variety}",
      cost: rand(0.5..150.99),
      country_of_origin: Faker::Space.planet
    )
end

