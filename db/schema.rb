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

ActiveRecord::Schema[7.0].define(version: 2023_08_20_000025) do
  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.text "plot"
    t.integer "number"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "library_items", force: :cascade do |t|
    t.integer "user_id"
    t.string "product_type"
    t.integer "product_id"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type", "product_id"], name: "index_library_items_on_product"
    t.index ["user_id"], name: "index_library_items_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_options", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2, default: "2.99"
    t.integer "video_quality"
    t.string "purchasable_type"
    t.integer "purchasable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchasable_type", "purchasable_id"], name: "index_purchase_options_on_purchasable"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "purchase_option_id"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "library_items", "users"
  add_foreign_key "purchases", "purchase_options"
  add_foreign_key "purchases", "users"
end
