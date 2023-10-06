class Conference < ApplicationRecord
  has_many :divisions
  validates :name, presence: true
end
