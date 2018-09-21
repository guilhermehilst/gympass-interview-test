require 'rails_helper'

RSpec.describe RacerLap, type: :model do
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:speed) }
  it { should belong_to(:racer) }
  it { should belong_to(:lap) }
end
