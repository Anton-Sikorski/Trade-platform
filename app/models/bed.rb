class Bed < ApplicationRecord
  has_many :products, as: :content, dependent: :destroy
end
