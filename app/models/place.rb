class Place < ApplicationRecord
  has_many :spots
  has_many :users, through: :spots

  validates :google_uid, uniqueness: true

end
