class GuestsController < ApplicationController
  before_action :set_guest, only: %i[show edit update destroy]
  before_action :set_guests, only: [:show]
  
  def index
    @guests = Guest.all
  end

  def show
    @friends = if params[:sort]
                 User.joins(:friendships).where('friendships.friend_id' => current_user.id).order(params[:sort])
               else
                 User.joins(:friendships).where('friendships.friend_id' => current_user.id)
               end
  end

  def edit; end

  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def set_guests
    @guest_search = Guest.search(params[:search]) if params[:search]
  end

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :phone_number, :address, :email, :lat, :lng)
  end
end
