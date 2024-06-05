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

ActiveRecord::Schema[7.1].define(version: 2024_06_05_194240) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_application_requirements", force: :cascade do |t|
    t.bigint "job_application_id"
    t.bigint "position_criterium_id"
    t.boolean "satisfied", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_application_id"], name: "index_job_application_requirements_on_job_application_id"
    t.index ["position_criterium_id"], name: "index_job_application_requirements_on_position_criterium_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "applicant_full_name"
    t.string "applicant_address"
    t.string "applicant_phone_number"
    t.string "applicant_oib"
    t.bigint "position_id"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.text "cv_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "cv_processed_at"
    t.index ["position_id"], name: "index_job_applications_on_position_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "position_criteria", force: :cascade do |t|
    t.bigint "position_id"
    t.string "criteria_value"
    t.boolean "required", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_position_criteria_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_positions_on_user_id"
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

  add_foreign_key "job_application_requirements", "job_applications"
  add_foreign_key "job_application_requirements", "position_criteria"
  add_foreign_key "job_applications", "positions"
  add_foreign_key "job_applications", "users"
  add_foreign_key "position_criteria", "positions"
  add_foreign_key "positions", "users"
end
