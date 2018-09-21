class Race < ApplicationRecord
  has_many :laps
  validates :name, presence: true
end
