class Racer < ApplicationRecord
  has_many :racer_laps
  has_many :laps, through: :racer_laps

  has_many :racer_infos
  has_many :races, through: :racer_infos

  validates :name, presence: true
  validates :code, presence: true
end
