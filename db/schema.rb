# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_25_012014) do

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "speciality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "examination_id"
    t.index ["examination_id"], name: "index_doctors_on_examination_id"
  end

  create_table "examinations", force: :cascade do |t|
    t.string "doctor_id"
    t.string "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "examination_id"
    t.index ["examination_id"], name: "index_patients_on_examination_id"
  end

  add_foreign_key "doctors", "examinations"
  add_foreign_key "patients", "examinations"
end
