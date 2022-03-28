# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
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
