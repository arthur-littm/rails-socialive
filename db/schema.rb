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

ActiveRecord::Schema.define(version: 20170723135647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "livestream_id"
    t.integer  "rubies_donated"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["livestream_id"], name: "index_donations_on_livestream_id", using: :btree
    t.index ["user_id"], name: "index_donations_on_user_id", using: :btree
  end

  create_table "livestreams", force: :cascade do |t|
    t.date     "date_time_of_stream"
    t.integer  "tickets_sold",        default: 0
    t.integer  "tickets_available"
    t.string   "category"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.string   "title"
    t.integer  "chat_room"
    t.string   "room_name"
    t.datetime "hour_of_stream"
    t.integer  "ticket_price"
    t.text     "description"
    t.boolean  "ended",               default: false
    t.boolean  "live",                default: false
    t.boolean  "donation_feature",    default: true
    t.string   "sessionId"
    t.boolean  "free_livestream"
    t.index ["user_id"], name: "index_livestreams_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "livestream_id"
    t.boolean  "donation"
    t.string   "msgtokbox"
    t.index ["livestream_id"], name: "index_messages_on_livestream_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.integer  "amount_pennies", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "rubies"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.float    "price"
    t.integer  "livestream_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "brand"
    t.index ["livestream_id"], name: "index_products_on_livestream_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "inquiry"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "livestream_id"
    t.index ["livestream_id"], name: "index_questions_on_livestream_id", using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "livestream_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["livestream_id"], name: "index_tickets_on_livestream_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
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
    t.string   "color"
    t.string   "icon"
    t.integer  "balance",                default: 0
    t.integer  "earned_balance",         default: 0
    t.boolean  "admin",                  default: false, null: false
    t.string   "username"
    t.string   "identification"
    t.string   "username_optional"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "donations", "livestreams"
  add_foreign_key "donations", "users"
  add_foreign_key "livestreams", "users"
  add_foreign_key "messages", "livestreams"
  add_foreign_key "messages", "users"
  add_foreign_key "products", "livestreams"
  add_foreign_key "products", "users"
  add_foreign_key "questions", "livestreams"
  add_foreign_key "questions", "users"
  add_foreign_key "tickets", "livestreams"
  add_foreign_key "tickets", "users"
end
