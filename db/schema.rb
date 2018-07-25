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

ActiveRecord::Schema.define(version: 2018_07_25_010543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "lobbying_dollars"
    t.integer "contribution_dollars"
    t.string "open_secret_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "most_lobbied_bill_id"
    t.index ["most_lobbied_bill_id"], name: "index_companies_on_most_lobbied_bill_id"
  end

  create_table "companies_share_holders", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "share_holder_id"
    t.index ["company_id"], name: "index_companies_share_holders_on_company_id"
    t.index ["share_holder_id"], name: "index_companies_share_holders_on_share_holder_id"
  end

  create_table "companies_top_recipients", force: :cascade do |t|
    t.bigint "top_recipient_id"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_companies_top_recipients_on_company_id"
    t.index ["top_recipient_id"], name: "index_companies_top_recipients_on_top_recipient_id"
  end

  create_table "most_lobbied_bills", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "share_holders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_subsidiaries_on_company_id"
  end

  create_table "top_recipients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
