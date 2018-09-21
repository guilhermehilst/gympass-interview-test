class Race < ApplicationRecord
  has_many :laps

  has_many :racer_infos
  has_many :racers, through: :racer_infos

  validates :name, presence: true
end
