class Api::V1::PlacesController < ApplicationController

  def index
    @places = Place.all
    render json: @places
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      render json: @place
    else
      @place = Place.find_by(google_uid: place_params[:google_uid])
      render @place
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :google_uid, :description, :lat, :lng, :address, :phone_number)
  end

end
