class Workspace < ApplicationRecord
  validates :name, :description, :capacity, :price, :city, :postcode, presence: true
  validates :terms_of_service, acceptance: true
  validates :name, length: 5..28

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :workspace_amenities, dependent: :destroy
  has_many :amenities, through: :workspace_amenities, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :photos
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?

  include PgSearch::Model
  pg_search_scope :search_by_location,
  against: [ :city, :postcode ],
      using: {
        tsearch: { prefix: true }
    }

  def average
    reviews.average(:rating).to_f.round(1)
  end
  # use regex to return first half of postcode for show page
end
