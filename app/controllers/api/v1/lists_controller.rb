class Api::V1::ListsController < ApplicationController

  def index
    @lists = UserList.where(user_id: user.id).map{|ul| ul.list}
    render json: @lists
  end

  def create
    @list = List.create(name: params[:name])
    UserList.create(user_id: user.id, list_id: @list.id)
    render json: @list
  end

  def update
    @list = List.find_by(id: params[:id])
    @list_spot = ListSpot.find_by(list_id: @list.id, spot_id: params[:spot_id])
    if @list_spot
      ListSpot.delete(@list_spot.id)
    else
      ListSpot.create(list_id: @list.id, spot_id: params[:spot_id])
    end
    render json: @list
  end

end
