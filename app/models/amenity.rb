class Amenity < ApplicationRecord
  has_many :workspace_amenities, dependent: :destroy
  has_one_attached :photo
end
