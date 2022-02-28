# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

6.times { Category.create(title: Faker::Lorem.words.join(" ")) }
100.times do
  h = {}
  h["size"] = rand(100_000..1_000_000).to_s.gsub /(\d{2})(\d{2})(\d{2})/, '\1x\2x\3'
  h[Faker::Lorem.word] = Faker::Lorem.word
  h[Faker::Lorem.word] = Faker::Lorem.word

  p = Product.create(title: Faker::Lorem.word, price: Faker::Number.decimal, category_id: rand(1..5))

  h.each_pair do |key, value|
    a = Feature.create(name: key, product_id: p.id)
    FeatureValue.create(value: value, feature_id: a.id)
  end
end

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
