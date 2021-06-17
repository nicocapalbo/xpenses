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

ActiveRecord::Schema.define(version: 2021_06_17_114225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ledger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_id"], name: "index_accounts_on_ledger_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "ledger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_id"], name: "index_categories_on_ledger_id"
  end

  create_table "ledgers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ledgers_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "ledger_id", null: false
    t.bigint "account_id", null: false
    t.date "date"
    t.string "info"
    t.bigint "subcategory_id", null: false
    t.boolean "cleared"
    t.decimal "payment"
    t.decimal "deposit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["ledger_id"], name: "index_transactions_on_ledger_id"
    t.index ["subcategory_id"], name: "index_transactions_on_subcategory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "ledgers"
  add_foreign_key "categories", "ledgers"
  add_foreign_key "ledgers", "users"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "ledgers"
  add_foreign_key "transactions", "subcategories"
end
