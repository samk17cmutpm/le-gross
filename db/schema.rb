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

ActiveRecord::Schema.define(version: 20170317080625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "containers", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "debts", force: :cascade do |t|
    t.integer  "customer_id"
    t.decimal  "total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_debts_on_customer_id", using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "order_item_id"
    t.date     "date_shipment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_item_id"], name: "index_deliveries_on_order_item_id", using: :btree
  end

  create_table "fakes", force: :cascade do |t|
    t.string   "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "import_order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "container_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "status"
    t.integer  "import_order_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["container_id"], name: "index_import_order_items_on_container_id", using: :btree
    t.index ["import_order_id"], name: "index_import_order_items_on_import_order_id", using: :btree
    t.index ["product_id"], name: "index_import_order_items_on_product_id", using: :btree
  end

  create_table "import_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_import_orders_on_order_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "order_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "repository_id"
    t.string   "status"
    t.boolean  "can_delivery"
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
    t.index ["repository_id"], name: "index_order_items_on_repository_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "code"
    t.date     "date"
    t.decimal  "total_price"
    t.decimal  "paid_amount"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  end

  create_table "packs", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "note"
    t.string   "shipment_by"
    t.string   "code"
    t.index ["product_id"], name: "index_packs_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "repositories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "waiting"
    t.string   "location"
    t.index ["product_id"], name: "index_repositories_on_product_id", using: :btree
  end

  add_foreign_key "debts", "customers"
  add_foreign_key "deliveries", "order_items"
  add_foreign_key "import_order_items", "containers"
  add_foreign_key "import_order_items", "import_orders"
  add_foreign_key "import_order_items", "products"
  add_foreign_key "import_orders", "orders"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "repositories"
  add_foreign_key "orders", "customers"
  add_foreign_key "repositories", "products"
end
