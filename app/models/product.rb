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
class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  has_many :features, dependent: :destroy

  accepts_nested_attributes_for :features, allow_destroy: true

  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :description, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
