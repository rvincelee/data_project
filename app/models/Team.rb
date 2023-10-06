class Team < ApplicationRecord
  has_many :players
  belongs_to :division
  validates :full_name, :abbreviation, :city, presence: true
end
