# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150907180742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "widget_id"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_templates", force: :cascade do |t|
    t.integer  "widget_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "widget_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "email_subject"
    t.text     "email_body"
    t.text     "sms_text"
    t.integer  "email_status"
    t.integer  "sms_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reviewers", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "widget_id"
    t.integer  "reviewer_id"
    t.boolean  "moderated"
    t.integer  "rate"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.string   "salt"
    t.integer  "role"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "active",          default: true
    t.boolean  "email_confirmed", default: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "uid"
    t.string   "company_name"
    t.string   "site_url"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
