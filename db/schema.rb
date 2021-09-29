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


ActiveRecord::Schema.define(version: 2021_09_28_101640) do


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

  create_table "answers", force: :cascade do |t|
    t.string "choice", default: "{}"
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "gift_recommendations", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.bigint "gift_session_id"
    t.index ["gift_session_id"], name: "index_gift_recommendations_on_gift_session_id"
    t.index ["product_id"], name: "index_gift_recommendations_on_product_id"
  end

  create_table "gift_sessions", force: :cascade do |t|
    t.integer "budget"
    t.bigint "order_id"
    t.bigint "user_id", null: false
    t.bigint "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_gift_sessions_on_order_id"
    t.index ["recipient_id"], name: "index_gift_sessions_on_recipient_id"
    t.index ["user_id"], name: "index_gift_sessions_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "product_id"
    t.bigint "cart_id"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "occasions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.bigint "user_id"
    t.bigint "cart_id"
    t.string "state"
    t.string "checkout_session_id"
    t.integer "amount_cents", default: 0, null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "image_url"
    t.string "brand"
    t.decimal "average_rating", precision: 2, scale: 1
    t.integer "price_cents", default: 0, null: fals
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.text "options", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "parent"
    t.integer "dependency"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "product_id"
    t.bigint "gift_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "recipient_id"
    t.index ["gift_session_id"], name: "index_ratings_on_gift_session_id"
    t.index ["product_id"], name: "index_ratings_on_product_id"
    t.index ["recipient_id"], name: "index_ratings_on_recipient_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "response_sets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "answer_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_response_sets_on_answer_id"
    t.index ["question_id"], name: "index_response_sets_on_question_id"
    t.index ["user_id"], name: "index_response_sets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birthday"
    t.string "address"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "gift_recommendations", "products"
  add_foreign_key "gift_sessions", "orders"
  add_foreign_key "gift_sessions", "users"
  add_foreign_key "gift_sessions", "users", column: "recipient_id"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "ratings", "gift_sessions"
  add_foreign_key "ratings", "products"
  add_foreign_key "ratings", "users"
  add_foreign_key "ratings", "users", column: "recipient_id"
  add_foreign_key "response_sets", "answers"
  add_foreign_key "response_sets", "questions"
  add_foreign_key "response_sets", "users"
end
