# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Bed, Pillow, Table].each do |product|
  10.times do
    b = product.new(size: Faker::Lorem.word, color: Faker::Lorem.word, material: Faker::Lorem.word)
    b.save
    p = Product.new(title: Faker::Lorem.word, :content => b,
                price: Faker::Number.decimal, description: Faker::Lorem.sentence)
    p.save
  end
end
