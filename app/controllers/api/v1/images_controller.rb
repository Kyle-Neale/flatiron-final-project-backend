class Api::V1::ImagesController < ApplicationController

  def create
    @spot = Spot.find_by(id: params[:id])
    @image = Image.create(spot_id: @spot.id, url: image_params[:url])
    render json: @spot
  end

  def image_params
    params.require(:image).permit(:url)
  end
end
