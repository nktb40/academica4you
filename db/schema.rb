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

ActiveRecord::Schema.define(version: 20140503181329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "world_part"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "street"
    t.string   "house"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_durations", force: true do |t|
    t.integer  "course_id"
    t.integer  "duration"
    t.string   "type"
    t.float    "price"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_features", force: true do |t|
    t.integer  "course_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "language_id"
    t.integer  "level_id"
    t.integer  "minimum_age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchange_rates", force: true do |t|
    t.integer  "currency_1_id"
    t.integer  "currency_2_id"
    t.float    "rate"
    t.integer  "actual_flg"
    t.integer  "deleted_flg"
    t.date     "valid_from_dttm"
    t.date     "valid_to_dttm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lang_levels", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "eng_name"
    t.string   "rus_name"
    t.string   "original_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lnk_school_courses", force: true do |t|
    t.integer  "school_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residence_durations", force: true do |t|
    t.string   "residence_id"
    t.integer  "duration"
    t.string   "type"
    t.float    "price"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residence_features", force: true do |t|
    t.integer  "residence_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "currency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residences", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.integer  "school_id"
    t.integer  "duration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "company_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "world_part"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "house"
    t.string   "latitude"
    t.string   "longitude"
  end

end
