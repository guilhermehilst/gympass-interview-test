require 'rails_helper'

RSpec.describe RacerInfo, type: :model do
  it { should validate_presence_of(:best_lap) }
  it { should validate_presence_of(:time_best_lap) }
  it { should validate_presence_of(:number_laps) }
  it { should validate_presence_of(:total_time) }
  it { should validate_presence_of(:avg_speed) }

  it { should belong_to(:racer) }
  it { should belong_to(:race) }
end

