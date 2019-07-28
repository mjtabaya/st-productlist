# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Brand.create do |b|
    b.name = Faker::Company.name
    100.times do
      b.products.new do |p|
        p.name = Faker::Commerce.product_name
        p.price = Faker::Commerce.price
      end
    end
  end
end
