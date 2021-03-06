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

ActiveRecord::Schema.define(version: 20150409035359) do

  create_table "accommodations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "address",     limit: 255
    t.string   "city",        limit: 255
    t.string   "phone",       limit: 255
    t.string   "website",     limit: 255
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "vacation_id", limit: 4
    t.string   "zip",         limit: 255
  end

  create_table "place_beens", force: :cascade do |t|
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.integer  "user_id",     limit: 4
    t.string   "address",     limit: 255
    t.text     "description", limit: 65535
    t.string   "title",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",                  limit: 255
    t.string   "last_name",                   limit: 255
    t.string   "username",                    limit: 255
    t.string   "route",                       limit: 255
    t.string   "locality",                    limit: 255
    t.string   "administrative_area_level_1", limit: 255
    t.integer  "postal_code",                 limit: 4
    t.float    "latitude",                    limit: 24
    t.float    "longitude",                   limit: 24
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id",                     limit: 4
    t.string   "place_id",                    limit: 255
    t.string   "country",                     limit: 255
    t.string   "street_number",               limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vacation_accommodations", force: :cascade do |t|
    t.integer  "vacation_id",      limit: 4
    t.integer  "accommodation_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "vacation_spots", force: :cascade do |t|
    t.float    "lat",           limit: 24
    t.float    "lng",           limit: 24
    t.string   "image",         limit: 255
    t.string   "spot_name",     limit: 255
    t.text     "description",   limit: 65535
    t.string   "route",         limit: 255
    t.string   "phone",         limit: 255
    t.string   "open",          limit: 255
    t.datetime "reservation"
    t.string   "website",       limit: 255
    t.text     "note",          limit: 65535
    t.integer  "vacation_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "city",          limit: 255
    t.string   "state",         limit: 255
    t.string   "zip",           limit: 255
    t.string   "street_number", limit: 255
  end

  create_table "vacations", force: :cascade do |t|
    t.string   "vacation_name",  limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.integer  "arrive_by",      limit: 4,     default: 0
    t.integer  "transpertation", limit: 4,     default: 0
    t.text     "note",           limit: 65535
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

end
