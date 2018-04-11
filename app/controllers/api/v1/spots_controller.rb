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
    @place = Place.find_by(google_uid: place_params[:google_uid])
    if @place
      @place.update(place_params) # in the case that Google updates the place's attributes
    else
      @place = Place.create(place_params)
      @spot = Spot.create(user_id: user.id, place_id: @place.id, spot_type: params[:type])
    end
    @spot = Spot.find_or_create_by(user_id: user.id, place_id: @place.id)
    @spot.update(spot_type: params[:spot_type])
    byebug
    render json: @spot
  end

  def update
    @spot = Spot.find_by(id: params[:id])
    if @spot.update(spot_type: params[:spot_type])
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
    params.require(:place).permit(:name, :google_uid, :description, :lat, :lng, :address, :phone_number, :website)
  end

  def spot_params
    params.require(:spot).permit(:user_id, :place_id, :spot_type, :source)
  end


end
