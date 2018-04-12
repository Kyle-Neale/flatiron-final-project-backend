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

end
