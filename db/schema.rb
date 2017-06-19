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

ActiveRecord::Schema.define(version: 20170619210000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
    t.index ["product_id"], name: "index_cart_items_on_product_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "email",            null: false
    t.string   "street",           null: false
    t.string   "city",             null: false
    t.string   "country",          null: false
    t.string   "zip_code",         null: false
    t.string   "house_number"
    t.integer  "apartment_number"
  end

  create_table "products", force: :cascade do |t|
    t.string   "code",       limit: 3,                 null: false
    t.string   "name",                                 null: false
    t.decimal  "price",                default: "0.0", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["code"], name: "index_products_on_code", using: :btree
  end

end
