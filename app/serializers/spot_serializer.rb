class SpotSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :place
  belongs_to :user
  has_many :comments
end
