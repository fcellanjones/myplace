class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :terms_of_service, acceptance: true

  has_many :workspaces
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many :favorites
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
