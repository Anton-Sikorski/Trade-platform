# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Category, type: :model do
  describe ".create" do
    context "with valid attributes" do
      include_examples "creates_object_for", :category
    end

    context "with invalid attributes" do
      context "with too short title" do
        include_examples "not_create_object_for", :category, title: "a"
      end

      context "with repeating title" do
        before { create(:category, title: "test") }

        include_examples "not_create_object_for", :category, title: "test"
      end
    end

    context "with missing attributes" do
      context "with missing title" do
        include_examples "not_create_object_for", :category, title: nil
      end
    end
  end
end
