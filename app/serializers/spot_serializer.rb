class SpotSerializer < ActiveModel::Serializer
  attributes :id, :spot_type, :user_id, :source
  belongs_to :place
  has_many :comments
  has_many :images
end
