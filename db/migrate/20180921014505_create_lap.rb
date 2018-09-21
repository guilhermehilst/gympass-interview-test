class CreateLap < ActiveRecord::Migration[5.2]
  def change
    create_table :laps do |t|
      t.integer :number
      t.belongs_to :race, index: true
    end
  end
end
