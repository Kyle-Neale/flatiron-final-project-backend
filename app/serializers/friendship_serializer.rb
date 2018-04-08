class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :pending, :accepted
  belongs_to :friend, serializer: UserSerializer
end
