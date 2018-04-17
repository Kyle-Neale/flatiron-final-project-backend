class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :image_url
  has_many :spots, serializer: SpotSerializer
end
