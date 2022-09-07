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

ActiveRecord::Schema.define(version: 2022_09_06_144242) do

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment_equipment_types", force: :cascade do |t|
    t.integer "equipment_type_id"
    t.integer "equipment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_id"], name: "index_equipment_equipment_types_on_equipment_id"
    t.index ["equipment_type_id"], name: "index_equipment_equipment_types_on_equipment_type_id"
  end

  create_table "equipment_types", force: :cascade do |t|
    t.integer "equipment_type_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_type_id"], name: "index_equipment_types_on_equipment_type_id"
  end

  create_table "exercise_equipments", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "equipment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_id"], name: "index_exercise_equipments_on_equipment_id"
    t.index ["exercise_id"], name: "index_exercise_equipments_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "reps"
    t.string "name"
    t.text "description"
    t.integer "rest_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_type_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  create_table "workout_types", force: :cascade do |t|
    t.integer "workout_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_workout_types_on_workout_id"
  end

  create_table "workout_workout_types", force: :cascade do |t|
    t.integer "workout_type_id"
    t.integer "workout_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_workout_workout_types_on_workout_id"
    t.index ["workout_type_id"], name: "index_workout_workout_types_on_workout_type_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "equipment_equipment_types", "equipment"
  add_foreign_key "equipment_equipment_types", "equipment_types"
  add_foreign_key "equipment_types", "equipment_types"
  add_foreign_key "exercise_equipments", "equipment"
  add_foreign_key "exercise_equipments", "exercises"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "users", "user_types"
  add_foreign_key "workout_workout_types", "workout_types"
  add_foreign_key "workout_workout_types", "workouts"
  add_foreign_key "workouts", "users"
end
