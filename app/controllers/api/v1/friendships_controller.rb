class Api::V1::FriendshipsController < ApplicationController

  def create
    @friend = User.find_by(id: params[:friend_id])
    @friendship = user.friend_request(@friend)
    @friend = @friendship.friend
    @message = "#{user.username} sent you a friend request."
    Notification.create(user_id: @friend.id, message: @message)
    render json: @friend, serializer: UserSerializer, status: 200
  end

  def update
    @friend = User.find_by(id: params[:friend_id])
    if params[:accepted]
      user.accept_request(@friend)
      @message = "#{@friend.username} accepted your friend request."
      Notification.create(user_id: @friend.id, message: @message)
    else
      user.decline_request(@friend)
    end
    render json: @friend, serializer: UserSerializer, status: 200
  end

  def destroy
    @friendship = Friendship.find_by(user_id: user.id, friend_id: params[:friend_id])
    @friend = @friendship.friend
    @friendship.destroy
    render json: @friend, serializer: UserSerializer, status: 200
  end
end
