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
class Feature < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :value, presence: true, length: { minimum: 2 }
end
