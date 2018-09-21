class Race::Parser
  class << self
    def call(file, race)
      File.open(file.path).each do |line|
        params = line.split(' ')

        racer = Racer.where(code: params[1], name: params[3]).first_or_create
        lap = race.laps.where(number: params[4]).first_or_create

        RacerLap.create(racer: racer,
                        lap: lap,
                        time: params[0].to_datetime,
                        duration: parse_duration(params[5]),
                        speed: params[6].gsub(',','.'))

      end
    end

    private

    def parse_duration(duration)
      minutes, seconds = duration.split(':')

      (minutes.to_f * 60) + seconds.to_f
    end
  end
end
