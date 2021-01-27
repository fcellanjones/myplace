class WorkspaceAmenity < ApplicationRecord
  belongs_to :workspace
  belongs_to :amenity
  has_many :workspace_amenities
  has_many :amenities, through: :workspace_amenities
end
