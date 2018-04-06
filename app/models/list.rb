class List < ApplicationRecord
  has_many :list_spots
  has_many :spots, through: :list_spots
  has_many :user_lists
  has_many :users, through: :user_lists
end
