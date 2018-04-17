class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :user_image

  def user_image
    object.user.image_url
  end
end
