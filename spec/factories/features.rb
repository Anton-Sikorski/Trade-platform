# frozen_string_literal: true

# == Schema Information
#
# Table name: features
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_features_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :feature do
    product { FactoryBot.create(:product) }
    name { Faker::Lorem.unique.words(number: 2).join(" ") }
  end
end
