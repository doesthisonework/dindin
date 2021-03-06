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

ActiveRecord::Schema.define(version: 20140528010304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_saves", force: true do |t|
    t.integer  "user_id"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_saves", ["ingredient_id"], name: "index_ingredient_saves_on_ingredient_id", using: :btree
  add_index "ingredient_saves", ["user_id"], name: "index_ingredient_saves_on_user_id", using: :btree

  create_table "ingredient_uses", force: true do |t|
    t.integer  "recipe_id",     null: false
    t.integer  "ingredient_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quantity"
    t.string   "unit"
  end

  add_index "ingredient_uses", ["ingredient_id"], name: "index_ingredient_uses_on_ingredient_id", using: :btree
  add_index "ingredient_uses", ["recipe_id", "ingredient_id"], name: "index_ingredient_uses_on_recipe_id_and_ingredient_id", unique: true, using: :btree
  add_index "ingredient_uses", ["recipe_id"], name: "index_ingredient_uses_on_recipe_id", using: :btree

  create_table "ingredients", force: true do |t|
    t.string   "name",       null: false
    t.string   "category",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true, using: :btree

  create_table "recipe_favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_favorites", ["recipe_id"], name: "index_recipe_favorites_on_recipe_id", using: :btree
  add_index "recipe_favorites", ["user_id"], name: "index_recipe_favorites_on_user_id", using: :btree

  create_table "recipes", force: true do |t|
    t.string   "title",                 null: false
    t.string   "large_image_url"
    t.string   "small_image_url",       null: false
    t.string   "source_recipe_url"
    t.string   "source_site_url"
    t.string   "source_display_name",   null: false
    t.string   "yummly_id",             null: false
    t.string   "total_time"
    t.string   "total_time_in_seconds"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "ingredients"
    t.text     "credit"
  end

  add_index "recipes", ["title"], name: "index_recipes_on_title", unique: true, using: :btree
  add_index "recipes", ["yummly_id"], name: "index_recipes_on_yummly_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
