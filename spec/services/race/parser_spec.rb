require 'rails_helper'

RSpec.describe Race::Parser do
  describe '.call' do
    context 'when there is no Racer created' do
      it 'creates a racer' do
        race = create(:race)
        file = double('file', path: 'path_to_file')
        file_content = StringIO.new("23:49:08.277   038 – F.MASSA  1 1:02.852  44,275")

        allow(File).to receive(:open).and_return(file_content)

        expect{ Race::Parser.call(file, race) }.to change{ Racer.count }.by(1)
      end
    end

    context 'when already have a Racer created' do
      it 'dont creates another one' do
        race = create(:race)
        create(:racer, code: 38, name: 'F.MASSA')
        file = double('file', path: 'path_to_file')
        file_content = StringIO.new("23:49:08.277   038 – F.MASSA  1 1:02.852  44,275")

        allow(File).to receive(:open).and_return(file_content)

        expect{ Race::Parser.call(file, race) }.to change{ Racer.count }.by(0)
      end
    end

    context 'when there is no Lap created' do
      it 'creates a lap' do
        race = create(:race)
        file = double('file', path: 'path_to_file')
        file_content = StringIO.new("23:49:08.277   038 – F.MASSA  1 1:02.852  44,275")

        allow(File).to receive(:open).and_return(file_content)

        expect{ Race::Parser.call(file, race) }.to change{ Lap.count }.by(1)
      end
    end

    context 'when already have a Lap created' do
      it 'dont creates a lap' do
        race = create(:race)
        create(:lap, number: 1, race_id: race.id)
        file = double('file', path: 'path_to_file')
        file_content = StringIO.new("23:49:08.277   038 – F.MASSA  1 1:02.852  44,275")

        allow(File).to receive(:open).and_return(file_content)

        expect{ Race::Parser.call(file, race) }.to change{ Lap.count }.by(0)
      end
    end

    it 'creates a RacerLap with the right params' do
      race = create(:race)
      lap = create(:lap, number: 1, race_id: race.id)
      racer = create(:racer, name: 'F.MASSA', code: 38)
      file = double('file', path: 'path_to_file')
      file_content = StringIO.new("23:49:08.277   038 – F.MASSA  1 1:02.852  44,275")

      allow(File).to receive(:open).and_return(file_content)

      expect(RacerLap).to receive(:create).with(racer: racer,
                                                lap: lap,
                                                time: "23:49:08.277".to_datetime,
                                                duration: 62.852,
                                                speed: '44.275').and_call_original

      Race::Parser.call(file, race)
    end
  end
end
