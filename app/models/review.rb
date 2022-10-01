class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
 
  belongs_to :reservation

  def reservation
    self[:reservation_id] ? Reservation.find(self[:reservation_id]) : invitations.reservation
  end
end
