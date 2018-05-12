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

ActiveRecord::Schema.define(version: 20140424193848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "component_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "unit"
  end

  add_index "component_types", ["code"], name: "index_component_types_on_code", using: :btree
  add_index "component_types", ["name"], name: "index_component_types_on_name", using: :btree

  create_table "components", force: :cascade do |t|
    t.integer "component_type_id"
    t.integer "food_id"
    t.float   "value"
  end

  add_index "components", ["component_type_id"], name: "index_components_on_component_type_id", using: :btree
  add_index "components", ["food_id"], name: "index_components_on_food_id", using: :btree

  create_table "constraints", force: :cascade do |t|
    t.integer  "component_type_id"
    t.integer  "course_id"
    t.float    "minimum_value"
    t.float    "maximum_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "constraints", ["component_type_id"], name: "index_constraints_on_component_type_id", using: :btree
  add_index "constraints", ["course_id"], name: "index_constraints_on_course_id", using: :btree

  create_table "course_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_types", ["name"], name: "index_course_types_on_name", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_type_id"
    t.integer  "diet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["course_type_id"], name: "index_courses_on_course_type_id", using: :btree
  add_index "courses", ["diet_id"], name: "index_courses_on_diet_id", using: :btree
  add_index "courses", ["name"], name: "index_courses_on_name", using: :btree

  create_table "diets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diets", ["name"], name: "index_diets_on_name", using: :btree
  add_index "diets", ["user_id"], name: "index_diets_on_user_id", using: :btree

  create_table "foods", force: :cascade do |t|
    t.integer "external_id"
    t.string  "name"
  end

  add_index "foods", ["external_id"], name: "index_foods_on_external_id", using: :btree
  add_index "foods", ["name"], name: "index_foods_on_name", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.integer  "plate_id"
    t.integer  "food_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["food_id"], name: "index_ingredients_on_food_id", using: :btree
  add_index "ingredients", ["plate_id"], name: "index_ingredients_on_plate_id", using: :btree

  create_table "meals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "diet_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meals", ["diet_id"], name: "index_meals_on_diet_id", using: :btree
  add_index "meals", ["user_id"], name: "index_meals_on_user_id", using: :btree

  create_table "plates", force: :cascade do |t|
    t.integer  "meal_id"
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plates", ["course_id"], name: "index_plates_on_course_id", using: :btree
  add_index "plates", ["meal_id"], name: "index_plates_on_meal_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.binary   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "remember_token"
    t.integer  "roles_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
