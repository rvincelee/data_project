class Division < ApplicationRecord
  belongs_to :conference
  has_many :teams
  validates :name, presence: true
end
