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

ActiveRecord::Schema.define(version: 20160509211049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "material_weight"
    t.integer  "material_id"
    t.integer  "job_id"
    t.integer  "output_id"
    t.integer  "input_id"
    t.boolean  "is_final",        default: false
    t.boolean  "is_raw",          default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "boxes", ["job_id"], name: "index_boxes_on_job_id", using: :btree
  add_index "boxes", ["location_id"], name: "index_boxes_on_location_id", using: :btree
  add_index "boxes", ["material_id"], name: "index_boxes_on_material_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_machines", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "machine_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "step_number"
  end

  add_index "job_machines", ["job_id"], name: "index_job_machines_on_job_id", using: :btree
  add_index "job_machines", ["machine_id"], name: "index_job_machines_on_machine_id", using: :btree
  add_index "job_machines", ["user_id"], name: "index_job_machines_on_user_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.text     "description"
    t.integer  "estimated_yield"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "customer_id"
    t.integer  "job_number"
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.string   "status",     default: "active"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "boxes", "jobs"
  add_foreign_key "boxes", "locations"
  add_foreign_key "boxes", "materials"
  add_foreign_key "job_machines", "jobs"
  add_foreign_key "job_machines", "machines"
  add_foreign_key "job_machines", "users"
  add_foreign_key "jobs", "customers"
end
