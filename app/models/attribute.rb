# frozen_string_literal: true

# == Schema Information
#
# Table name: attributes
#
#  id         :bigint           not null, primary key
#  name       :string
#  product_id :bigint           not null
#
class Attribute < ApplicationRecord
  has_many :attribute_values, dependent: :destroy
end
