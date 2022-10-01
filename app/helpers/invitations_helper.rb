module InvitationsHelper
  def panel_class(invitation)
    if invitation.confirmed.nil?
      'info'
    elsif invitation.expired?
      'warning'
    elsif invitation.confirmed == true
      'success'
    else
      'danger'
    end
  end
end
