class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def average
    reviews.average(:rating).to_f.round(1)
  end
end
