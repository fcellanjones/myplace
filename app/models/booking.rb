class Booking < ApplicationRecord
  validates :terms_of_service, acceptance: true

  belongs_to :user
  belongs_to :workspace
end
