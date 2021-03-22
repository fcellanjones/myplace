class Amenity < ApplicationRecord
  has_many :workspace_amenities, dependent: :destroy
end
