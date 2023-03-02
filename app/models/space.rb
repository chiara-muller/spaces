class Space < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :photos

  def unavailable_dates
    bookings.pluck(:start_date_time, :end_date_time).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
