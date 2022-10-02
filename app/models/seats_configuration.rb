class SeatsConfiguration < ApplicationRecord
  belongs_to :restaurant

  has_many :seats, dependent: :destroy

  def seat?(x, y)
    !seats.where(x:, y:).empty?
  end

  def seat_reserved?(x, y, time)
    seat = seats.where(x:, y:)
    seat.first.reserved?(time)
  end
end
