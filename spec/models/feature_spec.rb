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
require "rails_helper"

RSpec.describe Feature, type: :model do
  describe ".create" do
    context "with valid attributes" do
      include_examples "creates_object_for", :feature
    end

    context "with invalid attributes" do
      context "with too short title" do
        include_examples "not_create_object_for", :feature, name: "a"
      end

      context "with repeating title" do
        before { create(:feature, name: "test") }

        include_examples "not_create_object_for", :feature, name: "test"
      end

      context "with too short value" do
        include_examples "not_create_object_for", :feature, value: "a"
      end
    end

    context "with missing attributes" do
      context "with missing title" do
        include_examples "not_create_object_for", :feature, name: nil
      end

      context "with missing value" do
        include_examples "not_create_object_for", :feature, value: nil
      end
    end
  end
end
