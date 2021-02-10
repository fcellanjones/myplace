class Workspace < ApplicationRecord
  validates :terms_of_service, acceptance: true

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :workspace_amenities
  has_many :amenities, through: :workspace_amenities
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?

  include PgSearch::Model
  pg_search_scope :search_by_location,
  against: [ :city, :postcode ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def average
    reviews.average(:rating).to_f.round(1)
  end
end
