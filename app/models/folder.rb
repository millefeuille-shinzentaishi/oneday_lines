class Folder < ApplicationRecord
  has_many :codes
  belongs_to :user

  validate :name, presence: true
end
