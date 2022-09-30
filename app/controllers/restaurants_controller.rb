class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort]
      @restaurants = Restaurant.all.order(params[:sort])
    elsif params[:distance]
      @restaurants = Restaurant.all
      @restaurants.sort_by { |r| r.distance_to(current_user) }
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @configuration = @restaurant.seats_configuration
    @seats = @configuration.seats
    @date = params[:date]
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_restaurant
    if current_user.manager?
      @restaurant = current_user.restaurant
    else
      @restaurant = Restaurant.find(params[:id])
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:title, :description, :lat, :lng)
  end
end
