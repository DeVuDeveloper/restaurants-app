class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  has_one :invitation
  belongs_to :reservation

  def reservation
    self[:reservation_id] ? Reservation.find([:reservation_id]) : invitation.reservation
  end
end
