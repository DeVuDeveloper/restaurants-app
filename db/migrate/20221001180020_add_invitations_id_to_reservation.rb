class AddInvitationsIdToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :invitation, index: true
  end
end
