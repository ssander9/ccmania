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

ActiveRecord::Schema.define(version: 2020_09_17_012437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "card_provider"
    t.string "card_name"
    t.string "card_network"
    t.decimal "gas"
    t.decimal "transit"
    t.decimal "rideshare"
    t.decimal "entertainment"
    t.decimal "streaming"
    t.decimal "dining"
    t.decimal "grocery"
    t.decimal "drugstore"
    t.decimal "department_store"
    t.decimal "clothing"
    t.decimal "travel"
    t.decimal "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "handle"
    t.string "rewards_category"
    t.decimal "hotel"
    t.decimal "signup_bonus"
    t.integer "signup_bonus_spending_requirement_cents", default: 0, null: false
    t.string "signup_bonus_spending_requirement_currency", default: "USD", null: false
    t.integer "annual_fee_cents", default: 0, null: false
    t.string "annual_fee_currency", default: "USD", null: false
  end

  create_table "credit_cards_users_owned", force: :cascade do |t|
    t.bigint "credit_card_id"
    t.bigint "user_id"
    t.index ["credit_card_id"], name: "index_credit_cards_users_owned_on_credit_card_id"
    t.index ["user_id"], name: "index_credit_cards_users_owned_on_user_id"
  end

  create_table "credit_cards_users_starred", force: :cascade do |t|
    t.bigint "credit_card_id"
    t.bigint "user_id"
    t.index ["credit_card_id"], name: "index_credit_cards_users_starred_on_credit_card_id"
    t.index ["user_id"], name: "index_credit_cards_users_starred_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gas_cents", default: 0, null: false
    t.string "gas_currency", default: "USD", null: false
    t.integer "transit_cents", default: 0, null: false
    t.string "transit_currency", default: "USD", null: false
    t.integer "rideshare_cents", default: 0, null: false
    t.string "rideshare_currency", default: "USD", null: false
    t.integer "entertainment_cents", default: 0, null: false
    t.string "entertainment_currency", default: "USD", null: false
    t.integer "streaming_cents", default: 0, null: false
    t.string "streaming_currency", default: "USD", null: false
    t.integer "dining_cents", default: 0, null: false
    t.string "dining_currency", default: "USD", null: false
    t.integer "grocery_cents", default: 0, null: false
    t.string "grocery_currency", default: "USD", null: false
    t.integer "drugstore_cents", default: 0, null: false
    t.string "drugstore_currency", default: "USD", null: false
    t.integer "department_store_cents", default: 0, null: false
    t.string "department_store_currency", default: "USD", null: false
    t.integer "clothing_cents", default: 0, null: false
    t.string "clothing_currency", default: "USD", null: false
    t.integer "travel_cents", default: 0, null: false
    t.string "travel_currency", default: "USD", null: false
    t.integer "other_cents", default: 0, null: false
    t.string "other_currency", default: "USD", null: false
    t.boolean "is_admin", default: false
    t.integer "hotel_cents", default: 0, null: false
    t.string "hotel_currency", default: "USD", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
