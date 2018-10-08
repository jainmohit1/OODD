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

ActiveRecord::Schema.define(version: 2018_10_08_183435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "founded"
    t.string "synopsis"
    t.string "revenue"
    t.bigint "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_interest_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "house_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_house_interest_lists_on_company_id"
    t.index ["house_id"], name: "index_house_interest_lists_on_house_id"
    t.index ["user_id"], name: "index_house_interest_lists_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.bigint "company_id"
    t.string "location"
    t.bigint "square_footage"
    t.bigint "year_built"
    t.string "style"
    t.float "price_list"
    t.bigint "number_of_floors"
    t.boolean "basement"
    t.string "current_owner"
    t.string "contact_info_realtor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.json "image"
    t.index ["company_id"], name: "index_houses_on_company_id"
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "house_id"
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_inquiries_on_company_id"
    t.index ["house_id"], name: "index_inquiries_on_house_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "inquiry_replies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "house_id"
    t.bigint "inquiry_id"
    t.string "message"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_inquiry_replies_on_company_id"
    t.index ["house_id"], name: "index_inquiry_replies_on_house_id"
    t.index ["inquiry_id"], name: "index_inquiry_replies_on_inquiry_id"
    t.index ["user_id"], name: "index_inquiry_replies_on_user_id"
  end

  create_table "user_company_mappings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_company_mappings_on_company_id"
    t.index ["user_id"], name: "index_user_company_mappings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "email_address"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.bigint "phone_number"
    t.string "preferred_contact_method"
    t.string "role_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "house_interest_lists", "companies"
  add_foreign_key "house_interest_lists", "houses"
  add_foreign_key "house_interest_lists", "users"
  add_foreign_key "houses", "companies"
  add_foreign_key "houses", "users"
  add_foreign_key "inquiries", "companies"
  add_foreign_key "inquiries", "houses"
  add_foreign_key "inquiries", "users"
  add_foreign_key "inquiry_replies", "companies"
  add_foreign_key "inquiry_replies", "houses"
  add_foreign_key "inquiry_replies", "inquiries"
  add_foreign_key "inquiry_replies", "users"
  add_foreign_key "user_company_mappings", "companies"
  add_foreign_key "user_company_mappings", "users"
end
