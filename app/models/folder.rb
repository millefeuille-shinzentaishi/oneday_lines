class Folder < ApplicationRecord
  has_many :codes
  belongs_to :user

  validates :name, presence: true
end
