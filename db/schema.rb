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

ActiveRecord::Schema.define(version: 20140905163951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string  "name"
    t.string  "access_token"
    t.boolean "active"
  end

  create_table "artisans", force: true do |t|
    t.string   "name"
    t.integer  "tasks_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artisans", ["tasks_id"], name: "index_artisans_on_tasks_id", using: :btree

  create_table "artisans_tasks", id: false, force: true do |t|
    t.integer "artisan_id"
    t.integer "task_id"
  end

  create_table "attachments", force: true do |t|
    t.string   "document"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "changes", force: true do |t|
    t.text     "description"
    t.integer  "hours_spent_id"
    t.integer  "changed_by_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "runs_in_company_car"
    t.float    "km_driven_own_car"
    t.float    "toll_expenses_own_car"
    t.string   "supplies_from_warehouse"
    t.integer  "piecework_hours"
    t.integer  "overtime_50"
    t.integer  "overtime_100"
    t.integer  "hour"
    t.string   "text"
    t.text     "reason"
  end

  create_table "customer_messages", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "org_number"
    t.string   "contact_person"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_nr"
    t.string   "area"
    t.string   "email"
    t.boolean  "starred"
  end

  create_table "departments", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hours_spents", force: true do |t|
    t.integer  "customer_id"
    t.integer  "task_id"
    t.integer  "hour"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "piecework_hours"
    t.integer  "overtime_50"
    t.integer  "overtime_100"
    t.integer  "project_id"
    t.integer  "runs_in_company_car"
    t.float    "km_driven_own_car"
    t.float    "toll_expenses_own_car"
    t.string   "supplies_from_warehouse"
  end

  add_index "hours_spents", ["customer_id"], name: "index_hours_spents_on_customer_id", using: :btree
  add_index "hours_spents", ["task_id"], name: "index_hours_spents_on_task_id", using: :btree

  create_table "paints", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.date     "start_date"
    t.date     "due_date"
    t.text     "description"
    t.integer  "user_id"
    t.string   "execution_address"
    t.text     "customer_reference"
    t.text     "comment"
    t.boolean  "sms_employee_if_hours_not_registered", default: false
    t.boolean  "sms_employee_when_new_task_created",   default: false
    t.integer  "department_id"
    t.boolean  "starred"
    t.string   "short_description"
  end

  create_table "task_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "customer_id"
    t.integer  "task_type_id"
    t.datetime "start_date"
    t.boolean  "customer_buys_supplies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paint_id"
    t.integer  "artisan_id"
    t.boolean  "accepted"
    t.string   "description"
    t.boolean  "finished",               default: false
    t.integer  "project_id"
    t.date     "due_date"
  end

  add_index "tasks", ["customer_id"], name: "index_tasks_on_customer_id", using: :btree
  add_index "tasks", ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree

  create_table "tasks_users", id: false, force: true do |t|
    t.integer "task_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",                           null: false
    t.string   "roles",                                                     array: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "department_id"
    t.integer  "mobile",                 limit: 8
    t.string   "employee_nr"
    t.string   "position"
    t.string   "image"
    t.string   "emp_id"
    t.integer  "profession_id"
  end

  add_index "users", ["profession_id"], name: "index_users_on_profession_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
