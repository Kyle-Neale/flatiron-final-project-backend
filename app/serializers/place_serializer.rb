class PlaceSerializer < ActiveModel::Serializer
  attributes :google_uid, :address, :name, :lat, :lng, :phone_number, :website
end
