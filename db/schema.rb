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

ActiveRecord::Schema.define(version: 2019_09_26_195432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "frames", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "is_final"
    t.boolean "is_success"
    t.boolean "is_check_point"
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.index ["survey_id"], name: "index_frames_on_survey_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer "answers", default: [], array: true
    t.integer "check_point"
    t.integer "total_weight"
    t.bigint "frame_id"
    t.bigint "survey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["frame_id"], name: "index_game_sessions_on_frame_id"
    t.index ["survey_id"], name: "index_game_sessions_on_survey_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "text"
    t.string "code"
    t.integer "weight"
    t.bigint "frame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["frame_id"], name: "index_options_on_frame_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "start_frame_id"
  end

  create_table "triggers", force: :cascade do |t|
    t.string "type"
    t.json "condition"
    t.bigint "frame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["frame_id"], name: "index_triggers_on_frame_id"
  end

  add_foreign_key "frames", "surveys"
  add_foreign_key "game_sessions", "frames"
  add_foreign_key "game_sessions", "surveys"
  add_foreign_key "options", "frames"
  add_foreign_key "surveys", "frames", column: "start_frame_id"
  add_foreign_key "triggers", "frames"
end
