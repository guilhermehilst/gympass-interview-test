class CreateRacerInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :racer_infos do |t|
      t.integer :best_lap
      t.float :time_best_lap
      t.integer :number_laps
      t.float :total_time
      t.float :avg_speed
      t.belongs_to :race, index: true
      t.belongs_to :racer, index: true
    end
  end
end
