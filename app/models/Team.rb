class Team < ApplicationRecord
  belongs_to :division
  has_many :players
  validates :name, :abbreviation, :city, presence: true
end
