FactoryBot.define do
  factory :racer_lap do
    time { Time.now }
    duration { 42.342 }
    speed { 142.322 }
  end
end

