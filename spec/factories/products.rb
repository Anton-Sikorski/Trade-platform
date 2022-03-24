# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  price       :float            not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :product do
    category { FactoryBot.create(:category) }
    title { Faker::Lorem.unique.words(number: 2).join(" ") }
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal }
  end
end
