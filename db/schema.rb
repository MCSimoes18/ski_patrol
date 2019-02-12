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

ActiveRecord::Schema.define(version: 2019_02_12_225406) do

  create_table "bookings", force: :cascade do |t|
    t.integer "student_id"
    t.integer "mountain_instructor_id"
    t.integer "duration"
    t.datetime "book_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_fee"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.integer "rate"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mountain_instructors", force: :cascade do |t|
    t.integer "mountain_id"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mountains", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "trails"
    t.integer "lifts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mt_img"
    t.string "region"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "instructor_id"
    t.integer "student_id"
    t.integer "rating"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
  end

end
