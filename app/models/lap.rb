class Lap < ApplicationRecord
  has_many :racer_laps
  has_many :racers, through: :racer_laps

  validates :number, presence: true
end
