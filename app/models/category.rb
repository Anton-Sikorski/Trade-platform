# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :description, presence: true, uniqueness: true, length: { minimum: 6 }
end
