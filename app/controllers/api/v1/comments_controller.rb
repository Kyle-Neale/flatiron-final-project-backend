class Api::V1::CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    render json: @comment
  end

  def destroy
    @friendship = Friendship.find_by(user_id: user.id, friend_id: params[:friend_id])
    @friend = @friendship.friend
    @friendship.destroy
    render json: @friend, serializer: UserSerializer, status: 200
  end

  private

  def comment_params
    params.require(:comment).permit(:spot_id, :text)
  end

end
