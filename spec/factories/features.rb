# frozen_string_literal: true

# == Schema Information
#
# Table name: features
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  value       :string           not null
#  category_id :bigint
#  product_id  :bigint           not null
#
# Indexes
#
#  index_features_on_category_id  (category_id)
#  index_features_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :feature do
    product { FactoryBot.create(:product) }
    category { FactoryBot.create(:category) }
    name { Faker::Lorem.unique.words(number: 2).join(" ") }
    value { Faker::Lorem.unique.sentence }
  end
end
