class User < ApplicationRecord
  has_secure_password

  has_many :folders, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
