class AuthController  < ApplicationController

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: {id: @user.id, username: @user.username}
    else
      render json: {error: "No user or invalid password"}, status: 401
    end
  end

  def current_user
    
  end
end
