# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_05_074902) do

  create_table "favorites", force: :cascade do |t|
    t.integer "member_id"
    t.integer "my_schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_code", null: false
    t.integer "password", null: false
    t.string "group_name", null: false
    t.integer "admin_member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deleted", default: false, null: false
    t.index ["group_code"], name: "index_groups_on_group_code", unique: true
  end

  create_table "members", force: :cascade do |t|
    t.integer "group_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "color", default: "red", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "my_schedules", force: :cascade do |t|
    t.integer "member_id"
    t.date "start_date", null: false
    t.boolean "morning_select", default: false, null: false
    t.boolean "lunch_select", default: false, null: false
    t.boolean "dinner_select", default: false, null: false
    t.text "supplement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_my_schedules_on_member_id"
  end

  create_table "news", force: :cascade do |t|
    t.integer "group_id"
    t.integer "member_id"
    t.string "title", null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_news_on_group_id"
    t.index ["member_id"], name: "index_news_on_member_id"
  end

  add_foreign_key "my_schedules", "members"
  add_foreign_key "news", "groups"
  add_foreign_key "news", "members"
end
