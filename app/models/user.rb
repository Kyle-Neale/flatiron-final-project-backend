class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :notifications
  has_many :spots
  has_many :places, through: :spots
  has_many :user_lists
  has_many :lists, through: :user_lists

  validates :username, uniqueness: true

  has_secure_password

end
