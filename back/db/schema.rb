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

ActiveRecord::Schema.define(version: 2020_10_02_165649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_sheets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "questionnaire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "questionnaire_id"], name: "index_answer_sheets_on_user_id_and_questionnaire_id", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "order_answer_id"
    t.bigint "option_id"
    t.integer "free_question_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["order_answer_id"], name: "index_answers_on_order_answer_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "choice_question_id", null: false
    t.string "text"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_answers", force: :cascade do |t|
    t.bigint "answer_sheet_id"
    t.integer "order_num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_sheet_id"], name: "index_order_answers_on_answer_sheet_id"
    t.index ["order_num", "answer_sheet_id"], name: "index_order_answers_on_order_num_and_answer_sheet_id", unique: true
  end

  create_table "order_questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.integer "order_num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_num", "questionnaire_id"], name: "index_order_questions_on_order_num_and_questionnaire_id", unique: true
    t.index ["questionnaire_id"], name: "index_order_questions_on_questionnaire_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "abstract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "order_question_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["order_question_id"], name: "index_questions_on_order_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answer_sheets", "questionnaires", on_delete: :cascade
  add_foreign_key "answer_sheets", "users", on_delete: :cascade
  add_foreign_key "answers", "options", on_delete: :cascade
  add_foreign_key "answers", "order_answers", on_delete: :cascade
  add_foreign_key "order_answers", "answer_sheets", on_delete: :cascade
  add_foreign_key "order_questions", "questionnaires", on_delete: :cascade
  add_foreign_key "questions", "order_questions", on_delete: :cascade
end
