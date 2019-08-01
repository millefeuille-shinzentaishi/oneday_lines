class Code < ApplicationRecord
  belongs_to :folder

  validate :name, presence: true
end
