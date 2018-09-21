class RacerInfo < ApplicationRecord
  belongs_to :racer
  belongs_to :race

  validates :best_lap, presence: true
  validates :time_best_lap, presence: true
  validates :number_laps, presence: true
  validates :total_time, presence: true
  validates :avg_speed, presence: true
end
