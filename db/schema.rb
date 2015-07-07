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

ActiveRecord::Schema.define(version: 20150707164650) do

  create_table "challenge_settings", force: true do |t|
    t.integer  "challenge_id"
    t.boolean  "daily_email"
    t.boolean  "weekly_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenge_settings", ["challenge_id"], name: "index_challenge_settings_on_challenge_id"

  create_table "challenges", force: true do |t|
    t.integer  "user_id"
    t.string   "typus"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "number_of_milestones"
    t.integer  "finished_milestones"
    t.boolean  "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["user_id"], name: "index_challenges_on_user_id"

  create_table "invites", force: true do |t|
    t.integer  "mentor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "challenge_id"
    t.string   "token"
    t.integer  "inviter_id"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recepient_id"
    t.string   "subject"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", force: true do |t|
    t.integer  "challenge_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["challenge_id"], name: "index_milestones_on_challenge_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
