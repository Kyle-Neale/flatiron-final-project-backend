class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  include ActiveModel::Serialization

  def index
    @all = User.all
    @unfriended = User.unfriended(user)
    @friends = user.accepted_friends
    @requested_friends = user.requested_friends
    @pending_friends = user.pending_friends
    render json:
      {
        all: serialize(@all),
        unfriended: serialize(@unfriended),
        pending_friends: serialize(@pending_friends),
        accepted_friends: serialize(@friends),
        requested_friends: serialize(@requested_friends)
      }
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      jwt = issue_token(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), token: jwt}
    else
      render json: {error: @user.errors.messages}
    end
  end

  def update
    byebug
    if @user.update(user_params)
      render json: @user
    else
      render json: [error: @user.errors.messages]
    end
  end

  def destroy
    @user.destroy
    render json: ['message': "User deleted"]
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :name, :email, :image_url)
  end

  def serialize(collection)
    collection.map do |item|
      UserSerializer.new(item)
    end
  end

end
