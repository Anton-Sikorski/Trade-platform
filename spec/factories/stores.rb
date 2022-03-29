# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :store do
    name { Faker::Lorem.unique.words(number: 2).join(" ") }
  end
end
