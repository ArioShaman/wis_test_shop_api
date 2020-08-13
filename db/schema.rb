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

ActiveRecord::Schema.define(version: 2020_08_13_174933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "guest_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["guest_user_id"], name: "index_comments_on_guest_user_id"
  end

  create_table "guest_users", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "personal_data_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personal_data_id"], name: "index_orders_on_personal_data_id"
  end

  create_table "personal_data", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "comment"
    t.bigint "guest_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_user_id"], name: "index_personal_data_on_guest_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "name", default: ""
    t.string "price", default: ""
    t.string "image", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shoping_carts", force: :cascade do |t|
    t.bigint "guest_user_id"
    t.bigint "phone_id"
    t.integer "count", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["guest_user_id"], name: "index_shoping_carts_on_guest_user_id"
    t.index ["order_id"], name: "index_shoping_carts_on_order_id"
    t.index ["phone_id"], name: "index_shoping_carts_on_phone_id"
  end

  create_table "wish_lists", force: :cascade do |t|
    t.bigint "guest_user_id"
    t.bigint "phone_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_user_id"], name: "index_wish_lists_on_guest_user_id"
    t.index ["phone_id"], name: "index_wish_lists_on_phone_id"
  end

end
