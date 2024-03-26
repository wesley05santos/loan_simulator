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

ActiveRecord::Schema[7.1].define(version: 2024_03_26_221146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loan_installments", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.integer "number_of_installment", null: false
    t.decimal "value_installment", null: false
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "due_date", null: false
    t.index ["loan_id"], name: "index_loan_installments_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "requested_amount"
    t.integer "qtd_payments"
    t.decimal "interest_rate"
    t.decimal "installment_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "", null: false
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.bigint "loan_installment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "date_of_payment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
    t.index ["loan_installment_id"], name: "index_payments_on_loan_installment_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_profile", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "loan_installments", "loans"
  add_foreign_key "loans", "users"
  add_foreign_key "payments", "loan_installments"
  add_foreign_key "payments", "loans"
  add_foreign_key "payments", "users"
end
