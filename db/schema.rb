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

ActiveRecord::Schema.define(version: 2019_08_25_071050) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "postcode"
    t.text "address"
    t.integer "address_priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "purchase_quantity"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "check"
  end

  create_table "discs", force: :cascade do |t|
    t.string "disc_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "artist_id"
    t.string "single_album_name"
    t.integer "price"
    t.integer "label_id"
    t.integer "genre_id"
    t.integer "stock_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jacket_image_id"
    t.boolean "sales_status"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_price"
    t.integer "delivery_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_status"
    t.text "purchase_address"
    t.integer "purchase_postcode"
    t.integer "purchase_address_id"
  end

  create_table "purchase_products", force: :cascade do |t|
    t.string "single_album_name"
    t.string "jacket_image_id"
    t.integer "prodcut_price"
    t.string "label_name"
    t.string "genre_name"
    t.integer "purchase_quantity"
    t.integer "subtotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artist_name"
    t.integer "purchase_history_id"
  end

  create_table "song_titles", force: :cascade do |t|
    t.integer "disc_id"
    t.string "song_title"
    t.integer "truck_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "user_lastname"
    t.string "user_firstname"
    t.string "user_lastname_kana"
    t.string "user_firstname_kana"
    t.string "phone_number"
    t.string "admission_withdrawal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
