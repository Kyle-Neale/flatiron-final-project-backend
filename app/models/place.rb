class Place < ApplicationRecord
  has_many :saves
  has_many :users, through: :saves

  validates :google_uid, uniqueness: true

end
