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
      cost: rand(0.5..20.99),
      country_of_origin: Faker::Space.planet
    )
end

prod = Product.all.map { |p| p.id }

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::Name.name,
    content_body: Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false),
    rating: rand(5)+1,
    product_id: prod[rand(prod.length)])
end
