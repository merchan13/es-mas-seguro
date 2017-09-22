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

ActiveRecord::Schema.define(version: 20170922043131) do

  create_table "complaints", force: :cascade do |t|
    t.string   "policy_number", null: false
    t.string   "name",          null: false
    t.string   "phone",         null: false
    t.string   "email",         null: false
    t.text     "message",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "insurance_requests", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "insurance_type", null: false
    t.text     "message",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "contact_via",    null: false
    t.string   "email",          null: false
    t.string   "phone",          null: false
    t.string   "token"
    t.boolean  "token_expired"
    t.integer  "rating_id"
    t.index ["rating_id"], name: "index_insurance_requests_on_rating_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "calification",         null: false
    t.string   "message"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "insurance_request_id"
    t.index ["insurance_request_id"], name: "index_ratings_on_insurance_request_id"
  end

end
