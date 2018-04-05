class List < ApplicationRecord
  has_many :list_saves
  has_many :saves, through: :list_saves
  has_many :user_lists
  has_many :users, through: :user_lists
end
