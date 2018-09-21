require 'rails_helper'

RSpec.describe Lap, type: :model do
  it { should validate_presence_of(:number) }
  it { should have_many(:racer_laps) }
  it { should have_many(:racers).through(:racer_laps) }
end
