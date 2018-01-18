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

ActiveRecord::Schema.define(version: 20180118113919) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.string "author"
    t.decimal "price", precision: 10
    t.string "publication"
    t.string "version"
    t.decimal "copy", precision: 10
    t.bigint "library_id"
    t.bigint "category_id"
    t.bigint "issue_history_id"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["issue_history_id"], name: "index_books_on_issue_history_id"
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "issue_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "member_id"
    t.decimal "book_id", precision: 10
    t.date "return"
    t.date "issue"
    t.string "name"
    t.decimal "copy", precision: 10
    t.index ["member_id"], name: "index_issue_histories_on_member_id"
  end

  create_table "libraries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.decimal "phone", precision: 10
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "address"
    t.decimal "phone", precision: 10
    t.integer "gender"
    t.decimal "code", precision: 10
    t.date "validitydate"
    t.boolean "is_author"
    t.bigint "library_id"
    t.index ["library_id"], name: "index_members_on_library_id"
  end

  add_foreign_key "books", "categories"
  add_foreign_key "books", "issue_histories"
  add_foreign_key "books", "libraries"
  add_foreign_key "issue_histories", "members"
  add_foreign_key "members", "libraries"
end
