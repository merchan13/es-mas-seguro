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

ActiveRecord::Schema.define(version: 20170806190829) do

  create_table "car_insurance_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars_insurance_requests", force: :cascade do |t|
    t.string   "full_name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "email"
    t.string   "id_card"
    t.string   "country"
    t.string   "id_card_img"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "car_brand"
    t.string   "car_model"
    t.string   "car_year"
    t.string   "car_value"
    t.string   "driver_license"
    t.string   "vehicle_registration"
  end

  create_table "insurance_requests", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "insurance_type", null: false
    t.text     "message",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "contact_via"
  end

end
