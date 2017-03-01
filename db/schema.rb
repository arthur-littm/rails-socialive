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
ActiveRecord::Schema.define(version: 20170301184749) do
=======
ActiveRecord::Schema.define(version: 20170301192144) do
>>>>>>> 425cb6673fe64f2196000958d1a802b121945610

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "livestreams", force: :cascade do |t|
    t.date     "date_time_of_stream"
    t.integer  "tickets_sold"
    t.integer  "tickets_available"
    t.string   "category"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "title"
    t.integer  "chat_room"
    t.index ["user_id"], name: "index_livestreams_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "livestream_id"
    t.index ["livestream_id"], name: "index_messages_on_livestream_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "livestreamer",           default: false
    t.string   "facebooklink"
    t.string   "twitterlink"
    t.string   "instagramlink"
    t.string   "youtubelink"
    t.string   "snapchatlink"
    t.text     "bio"
    t.string   "fav1title"
    t.string   "fav2title"
    t.string   "fav3title"
    t.text     "fav1"
    t.text     "fav2"
    t.text     "fav3"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "livestreams", "users"
  add_foreign_key "messages", "livestreams"
  add_foreign_key "messages", "users"
end
