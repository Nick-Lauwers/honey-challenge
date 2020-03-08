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

ActiveRecord::Schema.define(version: 20200308180956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisements", force: :cascade do |t|
    t.decimal "integer"
    t.boolean "is_overruled?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combs", force: :cascade do |t|
    t.decimal "pollen_glob_target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nectars", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "comb_id"
    t.bigint "worker_bee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comb_id"], name: "index_nectars_on_comb_id"
    t.index ["worker_bee_id"], name: "index_nectars_on_worker_bee_id"
  end

  create_table "pollen_globs", force: :cascade do |t|
    t.decimal "quantity"
    t.bigint "comb_id"
    t.bigint "worker_bee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comb_id"], name: "index_pollen_globs_on_comb_id"
    t.index ["worker_bee_id"], name: "index_pollen_globs_on_worker_bee_id"
  end

  create_table "worker_bees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "nectars", "combs"
  add_foreign_key "nectars", "worker_bees"
  add_foreign_key "pollen_globs", "combs"
  add_foreign_key "pollen_globs", "worker_bees"
end
