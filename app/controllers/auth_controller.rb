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
    if user
      render json: user
    else
      render json: {error: "User not found or token expired"}, status: 401
    end
  end

  def api_key
    render json: {key: ENV["filestack_api_key"]}
  end
end
