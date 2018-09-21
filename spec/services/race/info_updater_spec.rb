require 'rails_helper'

RSpec.describe Race::InfoUpdater do
  describe '.call' do
    context 'when there is no RacerInfo created a race and a racer' do
      it 'creates a RacerInfo with the right parameters' do
        race = create(:race)
        racer = create(:racer, code: 38, name: 'F.MASSA')
        lap = create(:lap, number: 1, race_id: race.id)
        racer_lap = create(:racer_lap, lap_id: lap.id, racer_id: racer.id)

        Race::InfoUpdater.call(race, racer, racer_lap)

        expect(RacerInfo.last).to have_attributes({
          race_id: race.id,
          racer_id: racer.id,
          best_lap: lap.number,
          time_best_lap: racer_lap.duration,
          number_laps: lap.number,
          total_time: racer_lap.duration,
          avg_speed: racer_lap.speed
        })
      end
    end

    context 'when already have a RacerInfo created for a race and a racer' do
      context 'when RacerInfo.time_best_lap is smaller then new lap' do
        it 'only updates number_laps, total_time and avg_speed' do
          race = create(:race)
          racer = create(:racer, code: 38, name: 'F.MASSA')
          lap = create(:lap, number: 2, race_id: race.id)
          racer_lap = create(:racer_lap,
                             lap_id: lap.id,
                             racer_id: racer.id,
                             speed: 20.000,
                             duration: 10.321)

          racer_info = create(:racer_info,
                              race_id: race.id,
                              racer_id: racer.id,
                              best_lap: 1,
                              avg_speed: 10.000,
                              total_time: 9.123,
                              time_best_lap: 9.123)

          Race::InfoUpdater.call(race, racer, racer_lap)

          expect(racer_info.reload).to have_attributes({
            race_id: race.id,
            racer_id: racer.id,
            best_lap: 1,
            time_best_lap: 9.123,
            number_laps: lap.number,
            total_time: (9.123 + racer_lap.duration),
            avg_speed: (10.000 + 20.000)/2
          })
        end
      end

      context 'when RacerInfo.time_best_lap is bigger then new lap' do
        it 'updates all attributes' do
          race = create(:race)
          racer = create(:racer, code: 38, name: 'F.MASSA')
          lap = create(:lap, number: 2, race_id: race.id)
          racer_lap = create(:racer_lap,
                             lap_id: lap.id,
                             racer_id: racer.id,
                             speed: 20.000,
                             duration: 9.321)

          racer_info = create(:racer_info,
                              race_id: race.id,
                              racer_id: racer.id,
                              best_lap: 1,
                              avg_speed: 10.000,
                              total_time: 10.123,
                              time_best_lap: 10.123)

          Race::InfoUpdater.call(race, racer, racer_lap)

          expect(racer_info.reload).to have_attributes({
            race_id: race.id,
            racer_id: racer.id,
            best_lap: lap.number,
            time_best_lap: racer_lap.duration,
            number_laps: lap.number,
            total_time: (10.123 + racer_lap.duration),
            avg_speed: (10.000 + 20.000)/2
          })
        end
      end
    end
  end
end
