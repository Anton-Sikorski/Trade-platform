# frozen_string_literal: true

# == Schema Information
#
# Table name: pillows
#
#  id       :bigint           not null, primary key
#  size     :string
#  color    :string
#  material :string
#
class Pillow < ApplicationRecord
  has_many :products, as: :content, dependent: :destroy
end
