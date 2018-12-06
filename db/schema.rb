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

ActiveRecord::Schema.define(version: 20181206195627) do

  create_table "conversions", force: :cascade do |t|
    t.string "ip"
    t.string "user_agent"
    t.integer "pixel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pixel_id", "ip", "user_agent"], name: "index_conversions_on_pixel_id_and_ip_and_user_agent", unique: true
    t.index ["pixel_id"], name: "index_conversions_on_pixel_id"
  end

  create_table "pixels", force: :cascade do |t|
    t.string "name"
    t.integer "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_pixels_on_provider_id"
    t.index [nil, "name"], name: "index_pixels_on_providers_id_and_name", unique: true
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "name"], name: "index_providers_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_providers_on_user_id"
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

end
