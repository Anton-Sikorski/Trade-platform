# frozen_string_literal: true

# == Schema Information
#
# Table name: features
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_features_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Feature < ApplicationRecord
  belongs_to :product
  has_one :feature_value, dependent: :destroy
end
