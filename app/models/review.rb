class Review < ApplicationRecord
  validates :rating, presence: true
  belongs_to :workspace
  belongs_to :user
end
