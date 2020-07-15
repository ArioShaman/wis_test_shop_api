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

ActiveRecord::Schema.define(version: 2020_07_15_102807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_infos", force: :cascade do |t|
    t.string "account_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "country"
    t.string "prefix"
    t.string "prefix_business_id"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_account_infos_on_program_id"
  end

  create_table "barcodes", force: :cascade do |t|
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bols", force: :cascade do |t|
    t.string "bol_number"
    t.string "total_charges", default: "0.0"
    t.string "customer_owes", default: "0.0"
    t.string "currency", default: "USD"
    t.string "status", default: "unpaid"
    t.string "consignee_address"
    t.string "bol_notes"
    t.json "status_history", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "box_states", force: :cascade do |t|
    t.string "code", default: ""
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boxes", force: :cascade do |t|
    t.string "box_id", default: ""
    t.string "backode_id", default: ""
    t.string "tracking_number", default: ""
    t.json "parameters"
    t.string "location", default: ""
    t.string "notes", default: ""
    t.string "customer_notes", default: ""
    t.string "hold_status", default: ""
    t.string "hold_comment", default: ""
    t.string "extra_services", default: [], array: true
    t.string "consolidation_code", default: ""
    t.string "cut_down", default: ""
    t.string "protection_plus", default: ""
    t.string "current_status", default: ""
    t.json "status_history", default: []
    t.datetime "received_on"
    t.bigint "accountInfo_id"
    t.bigint "order_id"
    t.integer "overpack_id"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name", default: ""
    t.string "transition_id_id", default: ""
    t.string "programm_id", default: ""
    t.string "transition_id", default: ""
    t.boolean "scaned_for_order", default: false
    t.boolean "extra_services_status", default: false
    t.boolean "is_trashed", default: false
    t.json "images", default: []
    t.index ["accountInfo_id"], name: "index_boxes_on_accountInfo_id"
    t.index ["order_id"], name: "index_boxes_on_order_id"
    t.index ["overpack_id"], name: "index_boxes_on_overpack_id"
    t.index ["state_id"], name: "index_boxes_on_state_id"
  end

  create_table "claims", force: :cascade do |t|
    t.string "claim_id"
    t.string "tracking"
    t.string "account_id"
    t.string "invoice_img"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shop_url", default: ""
    t.integer "count"
    t.string "price", default: ""
    t.string "currency", default: ""
  end

  create_table "extra_services", force: :cascade do |t|
    t.bigint "service_kind_id"
    t.bigint "box_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "image_id"
    t.index ["box_id"], name: "index_extra_services_on_box_id"
    t.index ["image_id"], name: "index_extra_services_on_image_id"
    t.index ["service_kind_id"], name: "index_extra_services_on_service_kind_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_info_id"
    t.integer "quantity", default: 0
    t.string "merchant_name", default: ""
    t.string "merchant_number", default: ""
    t.boolean "open", default: true
    t.boolean "hold", default: false
    t.string "hold_comment", default: ""
    t.string "carrier_name", default: ""
    t.string "carrier_tracking_number", default: ""
    t.json "order_items", default: []
    t.json "order_status_info", default: []
    t.bigint "overpack_id"
    t.integer "agent_id"
    t.string "agent_name", default: ""
    t.string "agent_address", default: ""
    t.bigint "bol_id"
    t.json "parameters", default: {"width"=>"0.00", "height"=>"0.00", "length"=>"0.00", "weight"=>"0.00"}
    t.boolean "ready_overpack", default: false
    t.string "price_usd", default: "0.00"
    t.json "details", default: {}
    t.string "pack_method", default: "no"
    t.string "pack_comment", default: ""
    t.json "address_info", default: {"country"=>"", "region"=>"", "city"=>"", "address"=>"", "index"=>"", "phone"=>""}
    t.boolean "added_to_overpack", default: false
    t.bigint "prefix_business_id"
    t.index ["bol_id"], name: "index_orders_on_bol_id"
    t.index ["overpack_id"], name: "index_orders_on_overpack_id"
    t.index ["prefix_business_id"], name: "index_orders_on_prefix_business_id"
  end

  create_table "overpacks", force: :cascade do |t|
    t.string "text", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "overpack_id", default: ""
    t.json "statuses", default: []
    t.boolean "open", default: true
    t.json "sizes", default: {"length"=>nil, "width"=>nil, "weight"=>nil, "height"=>nil}
    t.string "airway_bill", default: ""
    t.string "shipment_date", default: ""
    t.string "manifest_num", default: ""
  end

  create_table "phones", force: :cascade do |t|
    t.string "name", default: ""
    t.string "price", default: ""
    t.string "image", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prefix_businesses", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "logo_base64"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "program_id", default: ""
  end

  create_table "service_comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "user_id"
    t.bigint "extra_service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "files", default: []
    t.index ["extra_service_id"], name: "index_service_comments_on_extra_service_id"
    t.index ["user_id"], name: "index_service_comments_on_user_id"
  end

  create_table "service_kinds", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "full_name"
    t.string "avatar"
    t.string "email"
    t.integer "account_info_id"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isAdmin", default: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "phone", default: ""
    t.string "position", default: ""
    t.json "history", default: []
    t.boolean "is_blocked", default: false
    t.boolean "is_delete", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
