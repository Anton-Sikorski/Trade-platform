# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(email: "anton@mail.tu", name: "Anton", password: "123456")

6.times do
  Category.create(
    title: Faker::Lorem.words.join(" "),
    description: Faker::Lorem.sentence
  )
end

10.times do
  Store.create(
    name: Faker::Lorem.words.join(" ")
  )
end

100.times do
  h = {}
  h["size"] = rand(100_000..1_000_000).to_s.gsub /(\d{2})(\d{2})(\d{2})/, '\1x\2x\3'
  rand(1..6).times { h[Faker::Lorem.word] = Faker::Lorem.word }

  p = Product.create(
    title: Faker::Lorem.word,
    description: Faker::Lorem.sentence,
    price: Faker::Number.decimal,
    category_id: rand(1..6),
    store_id: rand(1..10)
  )

  p.images.attach(io: URI.open("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{rand(1..100)}.png"), filename: "p-#{p.id}-image")

  h.each_pair { |key, value| Feature.create(name: key, value: value, product_id: p.id) }
end

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
