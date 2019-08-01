class User < ApplicationRecord
  has_secure_password

  has_many :folders

  validate :name, presence: true, uniqueness: true
end
