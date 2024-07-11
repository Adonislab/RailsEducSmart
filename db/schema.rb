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

ActiveRecord::Schema[7.2].define(version: 2024_07_11_145030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_details_id", null: false
    t.index ["course_details_id"], name: "index_categories_on_course_details_id"
  end

  create_table "course_details", force: :cascade do |t|
    t.string "content"
    t.string "video"
    t.string "audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.bigint "categories_id", null: false
    t.index ["categories_id"], name: "index_courses_on_categories_id"
    t.index ["users_id"], name: "index_courses_on_users_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "score"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.bigint "courses_id", null: false
    t.index ["courses_id"], name: "index_evaluations_on_courses_id"
    t.index ["users_id"], name: "index_evaluations_on_users_id"
  end

  create_table "order_claims", force: :cascade do |t|
    t.string "claim_type"
    t.text "description"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_order_claims_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "jti", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "course_details", column: "course_details_id"
  add_foreign_key "courses", "categories", column: "categories_id"
  add_foreign_key "courses", "users", column: "users_id"
  add_foreign_key "evaluations", "courses", column: "courses_id"
  add_foreign_key "evaluations", "users", column: "users_id"
  add_foreign_key "order_claims", "users", column: "users_id"
end
