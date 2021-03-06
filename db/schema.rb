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

ActiveRecord::Schema.define(version: 20161031013548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dispensers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "purpose_statement"
    t.string   "dispensable_type"
    t.integer  "dispensable_id"
    t.integer  "significant_id"
    t.datetime "delivery_time"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dispenser_id"
    t.text     "message"
    t.string   "emoji"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent",         default: false
  end

  create_table "significants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sprinkles_messengers", force: :cascade do |t|
    t.integer "frequency"
    t.integer "period"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

end
