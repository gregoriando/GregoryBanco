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

ActiveRecord::Schema.define(version: 2023_10_09_213808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "account_type"
    t.decimal "current_balance"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bank_branch_id", null: false
    t.index ["bank_branch_id"], name: "index_accounts_on_bank_branch_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
  end

  create_table "bank_branches", force: :cascade do |t|
    t.string "branch_name"
    t.integer "branch_type"
    t.string "legal_responsible"
    t.date "open_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bank_transactions", force: :cascade do |t|
    t.integer "transaction_type"
    t.decimal "transaction_value"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_bank_transactions_on_account_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cpf"
    t.string "rg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "bank_branches"
  add_foreign_key "accounts", "customers"
  add_foreign_key "bank_transactions", "accounts"
end
