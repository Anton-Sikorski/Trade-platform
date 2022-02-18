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
require "rails_helper"

RSpec.describe FeatureValue, type: :model do
  describe ".create" do
    context "with valid attributes" do
      include_examples "creates_object_for", :feature_value
    end

    context "with invalid attributes" do
      context "with too short title" do
        include_examples "not_create_object_for", :feature_value, value: "a"
      end

      context "with repeating title" do
        before { create(:feature_value, value: "test") }

        include_examples "not_create_object_for", :feature_value, value: "test"
      end
    end

    context "with missing attributes" do
      context "with missing title" do
        include_examples "not_create_object_for", :feature_value, value: nil
      end
    end
  end
end
