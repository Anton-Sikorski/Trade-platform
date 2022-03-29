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
require "rails_helper"

RSpec.describe Store, type: :model do
  describe ".create" do
    context "with valid attributes" do
      include_examples "creates_object_for", :store
    end

    context "with invalid attributes" do
      context "with too short name" do
        include_examples "not_create_object_for", :store, name: "a"
      end

      context "with repeating name" do
        before { create(:store, name: "test") }

        include_examples "not_create_object_for", :store, name: "test"
      end
    end

    context "with missing attributes" do
      context "with missing name" do
        include_examples "not_create_object_for", :store, name: nil
      end
    end
  end
end
