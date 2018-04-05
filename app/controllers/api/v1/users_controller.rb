class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      jwt = issue_token(user_id: @user.id)
      render json: {user: @user, token: jwt}
    else
      render json: [error: @user.errors.messages]
    end
  end

  def update
    if @user.update(params[:user])
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
    params.require(:user).permit(:username, :password)
  end

end
