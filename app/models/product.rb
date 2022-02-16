class Product < ApplicationRecord
  belongs_to :content, polymorphic: true

  scope :beds, -> { Bed.all }
end
