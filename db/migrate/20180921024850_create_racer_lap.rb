class CreateRacerLap < ActiveRecord::Migration[5.2]
  def change
    create_table :racer_laps do |t|
      t.datetime :time
      t.float :duration
      t.float :speed
      t.belongs_to :lap, index: true
      t.belongs_to :racer, index: true
    end
  end
end
