class Space < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :space_type, presence: true
  validates :price, presence: true
  validates :capacity, presence: true

  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :photos
end
