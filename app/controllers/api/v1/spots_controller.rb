class Api::V1::SpotsController < ApplicationController

  def index
    if user
      @spots = Spot.where(user_id: user.id)
    else
      @user_id = request.headers['Authorization']
      @spots = Spot.where(user_id: @user_id)
    end
    render json: @spots
  end

  def create
    @place = Place.find_or_create_by(place_params)
    @spot = Spot.find_or_create_by(user_id: user.id, place_id: @place.id)
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
    render json: {message: "Spot deleted."}
  end


  private

  def place_params
    params.require(:place).permit(:name, :google_uid, :description, :lat, :lng, :address, :phone_number)
  end

  def spot_params
    params.require(:spot).permit(:user_id, :place_id, :type, :source)
  end

end
