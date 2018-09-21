require 'rails_helper'

RSpec.describe Racer, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }
  it { should have_many(:racer_laps) }
  it { should have_many(:laps).through(:racer_laps) }
end
