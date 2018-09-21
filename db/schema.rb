# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_21_024850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "laps", force: :cascade do |t|
    t.integer "number"
    t.bigint "race_id"
    t.index ["race_id"], name: "index_laps_on_race_id"
  end

  create_table "racer_laps", force: :cascade do |t|
    t.datetime "time"
    t.float "duration"
    t.float "speed"
    t.bigint "lap_id"
    t.bigint "racer_id"
    t.index ["lap_id"], name: "index_racer_laps_on_lap_id"
    t.index ["racer_id"], name: "index_racer_laps_on_racer_id"
  end

  create_table "racers", force: :cascade do |t|
    t.integer "code"
    t.string "name"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
  end

end
