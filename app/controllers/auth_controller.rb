class AuthController  < ApplicationController

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      jwt = issue_token(user_id: @user.id)
      render json: {user: @user, token: jwt}
    else
      render json: {error: "No user or invalid password"}, status: 401
    end
  end

  def show
    if current_user
      render json: current_user
    else
      render json: {error: "User not found or token expired"}, status: 401
    end
  end
end
