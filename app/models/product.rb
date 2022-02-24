# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  title        :string
#  price        :float
#  description  :text
#  content_type :string
#  content_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :content, polymorphic: true

  scope :beds, -> { Bed.all }
end
