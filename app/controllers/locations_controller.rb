class LocationsController < ApplicationController
  def index
    
  end

  def all
    locations = Location.all
    render json: locations
  end

  def show
  end

end