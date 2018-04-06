class Spot < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :comments
  has_many :list_spots
  has_many :lists, through: :list_spots
end
