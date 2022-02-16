class Pillow < ApplicationRecord
  has_many :products, as: :content, dependent: :destroy
end
