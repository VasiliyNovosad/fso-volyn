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

ActiveRecord::Schema.define(version: 20151006182635) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "short_text"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "distance_id"
  end

  add_index "categories", ["distance_id"], name: "index_categories_on_distance_id"
  add_index "categories", ["race_id"], name: "index_categories_on_race_id"

  create_table "competitions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.text     "bulletin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitors", force: :cascade do |t|
    t.string   "surname"
    t.string   "name"
    t.datetime "birthday"
    t.string   "qualification"
    t.string   "trainer"
    t.integer  "category_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competitors", ["category_id"], name: "index_competitors_on_category_id"
  add_index "competitors", ["race_id"], name: "index_competitors_on_race_id"

  create_table "distances", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "distance_length"
    t.decimal  "cp_count"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "distances", ["race_id"], name: "index_distances_on_race_id"

  create_table "races", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "discipline"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.string   "place"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["competition_id"], name: "index_races_on_competition_id"

  create_table "results", force: :cascade do |t|
    t.integer  "start_number"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string   "state"
    t.integer  "competitor_id"
    t.integer  "race_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "results", ["competitor_id"], name: "index_results_on_competitor_id"
  add_index "results", ["race_id"], name: "index_results_on_race_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
