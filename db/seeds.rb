# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


20.times do
  h = Hash.new
  h['size'] = rand(100000..1000000).to_s.gsub /(\d{2})(\d{2})(\d{2})/, '\1x\2x\3'
  h['color'] =  Faker::Lorem.word
  h['material'] = Faker::Lorem.word

  p = Product.create(title: Faker::Lorem.word, price: Faker::Number.decimal, category:  %w[Games Furniture Home].sample)

  h.each_pair do |key,value|
    a = Attribute.create(name: key, product_id: p.id)
    AttributeValue.create(value: value, attribute_id: a.id)
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?