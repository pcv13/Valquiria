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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160919100833) do
=======
ActiveRecord::Schema.define(version: 20160916124139) do
>>>>>>> bf6136f1f4a987b88bf68a673029293171318f94

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_players", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_players_on_match_id"
    t.index ["player_id"], name: "index_match_players_on_player_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string   "name"
    t.datetime "star_time"
    t.string   "language"
    t.integer  "maximum_players"
<<<<<<< HEAD
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "game_id"
    t.boolean  "completed",       default: false
    t.boolean  "mastered",        default: false
    t.integer  "owner_id"
=======
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "game_id"
>>>>>>> bf6136f1f4a987b88bf68a673029293171318f94
    t.index ["game_id"], name: "index_matches_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

end