class LocationsController < ApplicationController
  before_action :require_user

  def index
    @location = Location.all
    @location = Location.order("name DESC")
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to new_location_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @location.attributes = location_params
    if @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
