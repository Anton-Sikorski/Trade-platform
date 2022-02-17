# frozen_string_literal: true

# == Schema Information
#
# Table name: attribute_values
#
#  id           :bigint           not null, primary key
#  value        :string
#  attribute_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class AttributeValue < ApplicationRecord
end
