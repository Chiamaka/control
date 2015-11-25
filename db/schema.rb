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

ActiveRecord::Schema.define(version: 20151125162404) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "bank_id"
    t.integer  "citizen_id"
    t.datetime "date_created"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "accounts", ["bank_id"], name: "index_accounts_on_bank_id"
  add_index "accounts", ["citizen_id"], name: "index_accounts_on_citizen_id"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.text     "security_question"
    t.text     "security_answer"
    t.string   "email"
    t.string   "phone"
    t.string   "level"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password_digest"
  end

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "bank_type"
    t.string   "reg_no"
    t.date     "founded"
    t.text     "headquarters"
    t.string   "ceo"
    t.text     "services"
    t.string   "email"
    t.string   "website"
    t.string   "logo_url"
    t.integer  "account_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "banks", ["account_id"], name: "index_banks_on_account_id"

  create_table "citizens", force: :cascade do |t|
    t.string   "name",       limit: 32, null: false
    t.text     "phone_num1"
    t.text     "phone_num2"
    t.text     "email"
    t.text     "address"
    t.string   "nat_id",                null: false
    t.datetime "created"
    t.datetime "updated"
    t.integer  "account_id"
  end

  add_index "citizens", ["account_id"], name: "index_citizens_on_account_id"

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.integer  "amount"
    t.integer  "balance"
    t.date     "transaction_date"
    t.integer  "account_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"

end
