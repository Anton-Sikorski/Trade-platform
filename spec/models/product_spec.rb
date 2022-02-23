# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
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
RSpec.describe Product, type: :model do
  describe ".create" do
    context "with valid attributes" do
      include_examples "creates_object_for", :product
    end

    context "with invalid attributes" do
      context "with too short title" do
        include_examples "not_create_object_for", :product, title: "a"
      end

      context "with repeating title" do
        before { create(:product, title: "test") }

        include_examples "not_create_object_for", :product, title: "test"
      end

      context "with negative price" do
        include_examples "not_create_object_for", :product, price: -0.1
      end
    end

    context "with missing attributes" do
      context "with missing title" do
        include_examples "not_create_object_for", :product, title: nil
      end

      context "with missing price" do
        include_examples "not_create_object_for", :product, price: nil
      end
    end
  end
end
