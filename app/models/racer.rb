class Racer < ApplicationRecord
  has_many :racer_laps
  has_many :laps, through: :racer_laps

  validates :name, presence: true
  validates :code, presence: true
end
