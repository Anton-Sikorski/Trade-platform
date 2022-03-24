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
RSpec.describe User, type: :model do
  describe ".create" do
    context "with valid attributes" do
      include_examples "creates_object_for", :user
    end

    context "with invalid attributes" do
      context "with too short name" do
        include_examples "not_create_object_for", :user, name: "a"
      end

      context "with repeating name" do
        before { create(:user, name: "test") }

        include_examples "not_create_object_for", :user, name: "test"
      end

      context "with invalid email format" do
        include_examples "not_create_object_for", :user, email: "test"
      end

      context "with repeating email" do
        before { create(:user, email: "test@test.test") }

        include_examples "not_create_object_for", :user, email: "test@test.test"
      end
    end

    context "with missing attributes" do
      context "with missing name" do
        include_examples "not_create_object_for", :user, name: nil
      end

      context "with missing email" do
        include_examples "not_create_object_for", :user, email: nil
      end

      context "with missing password" do
        include_examples "not_create_object_for", :user, password: nil
      end
    end
  end
end
