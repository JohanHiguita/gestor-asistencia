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

ActiveRecord::Schema.define(version: 2019_02_04_000032) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "class_sessions", force: :cascade do |t|
    t.integer "number"
    t.datetime "time"
    t.integer "user_id"
    t.integer "school_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week"
    t.index ["school_id"], name: "index_class_sessions_on_school_id"
    t.index ["student_id"], name: "index_class_sessions_on_student_id"
    t.index ["user_id"], name: "index_class_sessions_on_user_id"
  end

  create_table "class_sessions_students", id: false, force: :cascade do |t|
    t.integer "class_session_id", null: false
    t.integer "student_id"
    t.integer "class_sessions_id"
    t.index ["class_sessions_id"], name: "index_class_sessions_students_on_class_sessions_id"
    t.index ["student_id"], name: "index_class_sessions_students_on_student_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ConsSede"
    t.integer "comuna"
    t.integer "level"
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name_1"
    t.string "last_name_2"
    t.string "cc"
    t.integer "grade"
    t.integer "age"
    t.string "gender"
    t.integer "user_id"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tel"
    t.text "observations"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name_1"
    t.string "last_name_2"
    t.string "cc"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
