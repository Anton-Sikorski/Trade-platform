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
require "rails_helper"

RSpec.describe Feature, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
