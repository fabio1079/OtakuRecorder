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

ActiveRecord::Schema.define(version: 20140728192933) do

  create_table "animes", force: true do |t|
    t.string   "title"
    t.string   "season"
    t.string   "season_title", default: ""
    t.integer  "episode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "animes_tags", force: true do |t|
    t.integer  "anime_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animes_tags", ["anime_id"], name: "index_animes_tags_on_anime_id"
  add_index "animes_tags", ["tag_id"], name: "index_animes_tags_on_tag_id"

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mangas", force: true do |t|
    t.string   "title"
    t.string   "volume"
    t.integer  "chapter"
    t.string   "chapter_title", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
