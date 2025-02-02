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

ActiveRecord::Schema[8.0].define(version: 2025_01_24_191025) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "service_id", null: false
    t.datetime "appointment_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_appointments_on_car_id"
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
    t.index ["service_id"], name: "index_appointments_on_service_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row_number"
    t.index ["license_plate", "brand", "model"], name: "unique_license_brand_model", unique: true
    t.index ["license_plate"], name: "index_cars_on_license_plate", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "phone", "email"], name: "unique_customers_index", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "cars"
  add_foreign_key "appointments", "customers"
  add_foreign_key "appointments", "services"
end
