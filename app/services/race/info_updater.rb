class Race::InfoUpdater
  def self.call(race, racer, racer_lap)
    racer_info = RacerInfo.find_by(race: race, racer: racer)

    if racer_info
      if racer_info.time_best_lap > racer_lap.duration
        racer_info.best_lap = racer_lap.lap.number
        racer_info.time_best_lap = racer_lap.duration
      end
      racer_info.number_laps = racer_lap.lap.number
      racer_info.total_time += racer_lap.duration
      racer_info.avg_speed = (racer_info.avg_speed + racer_lap.speed)/2
      racer_info.save!
    else
      RacerInfo.create(race: race,
                       racer: racer,
                       best_lap: racer_lap.lap.number,
                       time_best_lap: racer_lap.duration,
                       number_laps: racer_lap.lap.number,
                       total_time: racer_lap.duration,
                       avg_speed: racer_lap.speed)
    end
  end
end
