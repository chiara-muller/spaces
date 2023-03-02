class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :user
  validate :start_date_time_cannot_be_in_the_past
  validate :end_date_time_cannot_be_in_the_past
  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validate :no_overlapping_bookings
  validate :end_date_time_after_start_date_time

  def no_overlapping_bookings
    overlapping_bookings = space.bookings.where.not(id: id).where(
      "(start_date_time, end_date_time) OVERLAPS (?, ?)",
      start_date_time, end_date_time
    )

    if overlapping_bookings.any?
      errors.add(:start_date_time, "is already booked during the selected time period")
    end
  end

  def start_date_time_cannot_be_in_the_past
    if start_date_time.present? && start_date_time <= Time.now
      errors.add(:start_date_time, "cant be in the past and must be made at least 24 hours in advance")
    end
  end

  def end_date_time_cannot_be_in_the_past
    if end_date_time.present? && end_date_time <= Time.now
      errors.add(:end_date_time, "can't be in the past and the bookings cant be shorter than a day")
    end
  end

  def end_date_time_after_start_date_time
    return if end_date_time.blank? || start_date_time.blank?

    if end_date_time < start_date_time
      errors.add(:end_date_time, "must be after the start date")
    end
  end
end
