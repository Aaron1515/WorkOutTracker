# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160605035610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measurements", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "body_fat"
    t.integer  "dead_lift"
    t.integer  "bench_press"
    t.integer  "squat"
    t.integer  "lat_pull"
    t.string   "img_url",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "measurement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "password_digest",     limit: 255
    t.boolean  "admin",                           default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "name",       limit: 255,                 null: false
    t.integer  "reps",                                   null: false
    t.integer  "sets",                                   null: false
    t.string   "weight",     limit: 255,                 null: false
    t.boolean  "completed",              default: false
    t.integer  "user_id"
    t.integer  "phase",                                  null: false
    t.integer  "rest",                                   null: false
    t.integer  "day",                                    null: false
    t.string   "note",       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

end
