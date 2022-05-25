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

ActiveRecord::Schema[7.0].define(version: 2022_05_25_064534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "name", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "customer_requests", force: :cascade do |t|
    t.text "email", null: false
    t.text "subject", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.boolean "deleted", default: false
    t.datetime "deleted_at"
    t.boolean "tag_visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_units", force: :cascade do |t|
    t.text "name", null: false
    t.text "nice_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.integer "retail_price", default: 0, null: false
    t.integer "sale_price", default: 0, null: false
    t.bigint "category_id"
    t.boolean "stock_available", default: true
    t.integer "quantity", null: false
    t.integer "discount_percent", null: false
    t.bigint "product_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deal_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["deal_id"], name: "index_products_on_deal_id"
    t.index ["product_unit_id"], name: "index_products_on_product_unit_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "deals"
  add_foreign_key "products", "product_units"
end
