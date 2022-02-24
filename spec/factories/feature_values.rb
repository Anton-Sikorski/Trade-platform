# frozen_string_literal: true

# == Schema Information
#
# Table name: feature_values
#
#  id         :bigint           not null, primary key
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  feature_id :bigint           not null
#
# Indexes
#
#  index_feature_values_on_feature_id  (feature_id)
#
# Foreign Keys
#
#  fk_rails_...  (feature_id => features.id)
#
FactoryBot.define do
  factory :feature_value do
    feature_id { FactoryBot.create(:feature).id }

    value { Faker::Lorem.word }
  end
end
