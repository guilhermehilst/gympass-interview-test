class CreateRacer < ActiveRecord::Migration[5.2]
  def change
    create_table :racers do |t|
      t.integer :code
      t.string :name
    end
  end
end
