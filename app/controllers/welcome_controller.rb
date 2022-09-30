class WelcomeController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    if current_user
      @invitations = current_user.invitations
    end
  end

end
