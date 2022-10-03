class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @invitations = current_user.invitations if current_user
  end
end
