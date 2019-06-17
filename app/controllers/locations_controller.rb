class LocationsController < ApplicationController
  before_action :set_locations, only: %i(index)
  before_action :set_location, only: %i(show)

  def index
  end

  def show
  end

  private

  def set_locations
    @locations = Location.all
  end

  def set_location
    @location = Location.find(params[:id])
  end

end
