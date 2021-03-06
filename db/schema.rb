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

ActiveRecord::Schema.define(version: 20140608163944) do

  create_table "calls", force: true do |t|
    t.string   "ip"
    t.string   "tel"
    t.text     "referer",    limit: 255
    t.string   "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sid"
    t.string   "status"
  end

  add_index "calls", ["sid"], name: "index_calls_on_sid"

end
