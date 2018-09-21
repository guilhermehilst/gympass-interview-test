class RacerLap < ApplicationRecord
  belongs_to :racer
  belongs_to :lap

  validates :time, presence: true
  validates :duration, presence: true
  validates :speed, presence: true
end
