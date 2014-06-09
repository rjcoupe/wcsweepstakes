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

ActiveRecord::Schema.define(version: 20140609101635) do

  create_table "groups", force: true do |t|
    t.string   "letter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.string   "stage"
    t.integer  "team1",                   null: false
    t.integer  "team2",                   null: false
    t.integer  "team1_goals"
    t.integer  "team2_goals"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
    t.integer  "group_id",    default: 0, null: false
  end

  create_table "people", force: true do |t|
    t.string   "name",                       null: false
    t.boolean  "eliminated", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "teams", force: true do |t|
    t.string   "name",                       null: false
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qpoints",        default: 0
    t.integer  "ggoals_for",     default: 0
    t.integer  "ggoals_against", default: 0
  end

end
