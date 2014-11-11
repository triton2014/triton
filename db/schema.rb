# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141111123116) do

  create_table "chats", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_attachements", force: true do |t|
    t.integer  "report_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "material_attachements", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
    t.string   "material_image"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "estimated_end_date"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "progress"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id", "user_id"], name: "index_projects_users_on_project_id_and_user_id"

  create_table "reports", force: true do |t|
    t.integer  "site_id"
    t.text     "summary"
    t.string   "effciency"
    t.string   "report_type"
    t.text     "controls_in_place"
    t.text     "project_start_condition"
    t.text     "todays_condition"
    t.text     "safety_meeting"
    t.text     "materials"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "material"
    t.string   "safety_doc"
    t.text     "todays_task"
    t.text     "tomorrows_task"
    t.datetime "report_date"
  end

  create_table "sites", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "tasks", force: true do |t|
    t.integer  "report_id"
    t.string   "task_type"
    t.string   "target_task"
    t.string   "completed_task"
    t.string   "efficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.integer  "project_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
