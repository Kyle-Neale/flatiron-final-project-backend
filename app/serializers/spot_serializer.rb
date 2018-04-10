class SpotSerializer < ActiveModel::Serializer
  attributes :id, :spot_type
  belongs_to :place
  has_many :comments
end
