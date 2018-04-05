class Save < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :comments
  has_many :list_saves
  has_many :lists, through: :list_saves
end
