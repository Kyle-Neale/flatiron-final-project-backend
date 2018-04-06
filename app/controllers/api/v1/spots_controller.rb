class Api::V1::SpotsController < ApplicationController

  def index
    @spots = Spot.all
    render json: @spots
  end

  def create
    @place = Place.find_or_create_by(place_params)
    @spot = Spot.create(user_id: current_user.id, place_id: @place.id)
    render json: @spot
  end

  def update
    if @spot.update(params[:spot])
      render json: @spot
    else
      render json: [error: @spot.errors.messages]
    end
  end

  def destroy
    @spot = Spot.find_by(id: params[:id])
    @spot.destroy
    render json: [message: "Spot deleted."]
  end


  private

  def place_params
    params.require(:place).permit(:name, :google_uid, :description, :lat, :lng, :address, :phone_number)
  end

  def spot_params
    params.require(:spot).permit(:user_id, :place_id, :type, :source)
  end

end
