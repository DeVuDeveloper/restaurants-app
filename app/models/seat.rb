class Seat < ApplicationRecord
  has_and_belongs_to_many :seat_configuration

  has_and_belongs_to_many :reservations

  def reserved?(time)
    return false if reservations.empty?

    reservations.each do |reservation|
      date_range = reservation.date.localtime..reservation.date.localtime + reservation.duration.hours
      return true if date_range.cover?(time.to_time)
    end
    false
  end
end
