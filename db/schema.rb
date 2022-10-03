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

ActiveRecord::Schema.define(version: 2022_10_02_110039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.boolean "confirmed"
    t.bigint "user_id"
    t.bigint "reservation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_invitations_on_reservation_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "price"
    t.bigint "menu_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_meals_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "restaurant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "date"
    t.integer "duration"
    t.integer "user_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "invitation_id"
    t.index ["invitation_id"], name: "index_reservations_on_invitation_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  end

  create_table "reservations_seats", id: false, force: :cascade do |t|
    t.integer "seat_id"
    t.integer "reservation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rating"
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.bigint "invitation_id"
    t.bigint "reservation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invitation_id"], name: "index_reviews_on_invitation_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.boolean "reserved"
    t.bigint "seats_configuration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seats_configuration_id"], name: "index_seats_on_seats_configuration_id"
  end

  create_table "seats_configurations", force: :cascade do |t|
    t.integer "area", default: 20
    t.integer "height", default: 10
    t.integer "width", default: 10
    t.bigint "restaurant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seat_id"
    t.index ["restaurant_id"], name: "index_seats_configurations_on_restaurant_id"
    t.index ["seat_id"], name: "index_seats_configurations_on_seat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "phone_number"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.integer "restaurant_id"
    t.string "role", null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "seats", "seats_configurations"
  add_foreign_key "seats_configurations", "restaurants"
end
