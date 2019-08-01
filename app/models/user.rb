class User < ApplicationRecord
  has_secure_password

  has_many :folders, dependent: :destroy
  has_many :records, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
