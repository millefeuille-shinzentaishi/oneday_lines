class Folder < ApplicationRecord
  belongs_to :user
  has_many :codes, dependent: :destroy


  validates :name, presence: true
end
