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

ActiveRecord::Schema.define(version: 20151124130628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_us", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "added_by_id"
    t.string   "added_by_name"
    t.string   "subject"
    t.text     "feedback"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
  end

  create_table "gatepass", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "to_who"
    t.string   "delivered_pcs"
    t.string   "total_amount"
    t.integer  "made_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "gatepasses", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "to_who"
    t.string   "delivered_pcs"
    t.string   "total_amount"
    t.integer  "made_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "personname"
    t.string   "invoice_type"
    t.text     "amount"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
  end

  create_table "leaves", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "person_name"
    t.datetime "from_when"
    t.string   "number_of_days"
    t.string   "subject"
    t.text     "description"
    t.string   "status",         default: "pending"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "customer_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email"
    t.string   "phn_number"
    t.string   "nric"
    t.string   "company_name"
    t.string   "address"
    t.string   "quantity"
    t.string   "sizing"
    t.string   "fabric_type"
    t.string   "delivery_date"
    t.string   "order_status",    default: "pending"
    t.text     "description"
    t.integer  "created_by_id"
    t.string   "created_by_name"
    t.text     "extra_note"
    t.integer  "price_per_piece"
    t.string   "image"
    t.string   "image1"
    t.string   "payment_status",  default: "unpaid"
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.string   "status"
    t.string   "gender"
    t.string   "price"
    t.text     "description"
    t.string   "quantity"
    t.string   "product_image"
    t.integer  "created_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "registers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "admin"
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "accessory_name"
    t.integer  "accessory_quantity"
    t.integer  "accessory_price_per_pcs"
    t.integer  "used_accessory"
    t.datetime "last_updated"
    t.integer  "added_by"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ussers", force: :cascade do |t|
    t.boolean  "admin"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "ussers", ["email"], name: "index_ussers_on_email", unique: true, using: :btree
  add_index "ussers", ["reset_password_token"], name: "index_ussers_on_reset_password_token", unique: true, using: :btree

end
