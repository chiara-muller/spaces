class Space < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :space_type, presence: true
  validates :price, presence: true
  validates :capacity, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos

  def unavailable_dates
    bookings.pluck(:start_date_time, :end_date_time).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
