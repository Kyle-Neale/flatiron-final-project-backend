class ListSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :spots
end
