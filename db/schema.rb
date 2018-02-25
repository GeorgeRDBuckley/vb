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

ActiveRecord::Schema.define(version: 20180225153810) do

  create_table "beer_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beer_id"], name: "index_beer_likes_on_beer_id"
    t.index ["user_id", "beer_id"], name: "index_beer_likes_on_user_id_and_beer_id", unique: true
    t.index ["user_id"], name: "index_beer_likes_on_user_id"
  end

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "style"
    t.string "abv"
    t.text "description"
    t.string "beer_image_file_name"
    t.string "beer_image_content_type"
    t.integer "beer_image_file_size"
    t.datetime "beer_image_updated_at"
    t.boolean "is_vegan"
    t.boolean "is_vegetarian"
    t.boolean "filtered"
    t.boolean "bootle_conditioned"
    t.boolean "can_conditioned"
    t.boolean "organic"
    t.boolean "gluten_free"
    t.boolean "alcohol_free"
    t.string "serving_temp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "brewery_id"
    t.boolean "brewery_confirmed", default: false
    t.datetime "brewery_confirmed_at"
    t.text "ingredients"
    t.index ["brewery_id"], name: "index_beers_on_brewery_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.string "country"
    t.string "email"
    t.string "telephone"
    t.string "website"
    t.text "description"
    t.string "brewery_logo_file_name"
    t.string "brewery_logo_content_type"
    t.integer "brewery_logo_file_size"
    t.datetime "brewery_logo_updated_at"
    t.string "slug"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.string "token"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_img_file_name"
    t.string "profile_img_content_type"
    t.integer "profile_img_file_size"
    t.datetime "profile_img_updated_at"
    t.string "name"
    t.string "location"
    t.text "bio"
    t.string "instagram"
    t.string "facebook"
    t.string "twitter"
    t.boolean "admin", default: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
