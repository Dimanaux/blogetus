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

ActiveRecord::Schema.define(version: 20190511221053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stories_count", default: 0
    t.index ["url"], name: "index_blogs_on_url", unique: true
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "story_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_favourites_on_story_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "story_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_likes_on_story_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url", default: ""
    t.boolean "published", default: false
    t.integer "views_count", default: 0, null: false
    t.index ["blog_id", "url"], name: "index_stories_on_blog_id_and_url", unique: true
    t.index ["blog_id"], name: "index_stories_on_blog_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blogs_count", default: 0
    t.integer "stories_count", default: 0
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "favourites", "stories"
  add_foreign_key "favourites", "users"
  add_foreign_key "likes", "stories"
  add_foreign_key "likes", "users"
end
