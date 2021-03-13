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

ActiveRecord::Schema.define(version: 2021_03_13_012434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "book_club_books", force: :cascade do |t|
    t.date "started_on"
    t.date "completed_on"
    t.bigint "book_id", null: false
    t.bigint "book_club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_club_id"], name: "index_book_club_books_on_book_club_id"
    t.index ["book_id"], name: "index_book_club_books_on_book_id"
  end

  create_table "book_clubs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "category", default: "", null: false
    t.datetime "meeting_time", null: false
    t.integer "current_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_book_clubs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_club_id"], name: "index_user_book_clubs_on_book_club_id"
    t.index ["user_id"], name: "index_user_book_clubs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_club_books", "book_clubs"
  add_foreign_key "book_club_books", "books"
  add_foreign_key "user_book_clubs", "book_clubs"
  add_foreign_key "user_book_clubs", "users"
end
