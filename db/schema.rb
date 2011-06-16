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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110607190832) do

  create_table "answers", :force => true do |t|
    t.string   "value"
    t.integer  "quiz_id",     :null => false
    t.integer  "subject_id",  :null => false
    t.integer  "question_id", :null => false
    t.integer  "option_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "value",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cost_centers", :force => true do |t|
    t.string   "value",         :null => false
    t.integer  "department_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "value",      :null => false
    t.integer  "company_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", :force => true do |t|
    t.string   "value",           :null => false
    t.integer  "status_id",       :null => false
    t.integer  "forms_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "multiple"
  end

  create_table "forms_options", :id => false, :force => true do |t|
    t.integer "option_id", :null => false
    t.integer "form_id",   :null => false
  end

  create_table "options", :force => true do |t|
    t.string   "value",           :null => false
    t.boolean  "has_text_field"
    t.integer  "status_id",       :null => false
    t.integer  "forms_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "value",                :null => false
    t.integer  "status_id",            :null => false
    t.integer  "form_id",              :null => false
    t.integer  "subjects_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disable"
    t.boolean  "has_text_field"
  end

  create_table "questions_subjects", :id => false, :force => true do |t|
    t.integer "question_id", :null => false
    t.integer "subject_id",  :null => false
  end

  create_table "quizzes", :force => true do |t|
    t.string   "value",              :null => false
    t.string   "description"
    t.integer  "status_id",          :null => false
    t.integer  "subjects_quizze_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "measurable_id"
    t.string   "measurable_type"
  end

  create_table "quizzes_subjects", :id => false, :force => true do |t|
    t.integer "quiz_id",    :null => false
    t.integer "subject_id", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "value",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "value",                :null => false
    t.integer  "status_id",            :null => false
    t.integer  "subjects_question_id"
    t.integer  "subjects_quizze_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pre_quiz"
    t.boolean  "disable"
  end

end
