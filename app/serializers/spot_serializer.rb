class SpotSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :place
  has_many :comments
end
