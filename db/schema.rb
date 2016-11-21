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

ActiveRecord::Schema.define(version: 20161121180440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer  "rango_inferior"
    t.integer  "rango_superior"
    t.text     "descripcion"
    t.string   "titulo"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "enable",         default: true
  end

  create_table "comments", force: :cascade do |t|
    t.text     "respuesta"
    t.text     "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "favour_id"
    t.integer  "user_id"
  end

  add_index "comments", ["favour_id"], name: "index_comments_on_favour_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favours", force: :cascade do |t|
    t.text     "descripcion"
    t.string   "titulo"
    t.string   "ciudad"
    t.string   "provincia"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "user_id"
    t.string   "image_url",   default: "http://gdurl.com/GY5O"
    t.boolean  "aceptado",    default: false
    t.boolean  "finalizado",  default: false
  end

  add_index "favours", ["user_id"], name: "index_favours_on_user_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.text     "descripcion"
    t.boolean  "calificacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "favour_id"
  end

  add_index "grades", ["favour_id"], name: "index_grades_on_favour_id", using: :btree
  add_index "grades", ["user_id"], name: "index_grades_on_user_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "puntos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "total"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.boolean  "aceptacion"
    t.text     "descripcion"
    t.date     "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "favour_id"
  end

  add_index "requests", ["favour_id"], name: "index_requests_on_favour_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.integer  "puntaje",                default: 0
    t.string   "pais"
    t.boolean  "sexo"
    t.string   "email"
    t.date     "fecha_nacimiento"
    t.boolean  "admin",                  default: false
    t.string   "tc_apellido"
    t.string   "tc_nombre"
    t.string   "tc_numero"
    t.integer  "tc_pin"
    t.date     "tc_caducidad"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "achievement_id"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["achievement_id"], name: "index_users_on_achievement_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "favours"
  add_foreign_key "comments", "users"
  add_foreign_key "favours", "users"
  add_foreign_key "grades", "favours"
  add_foreign_key "grades", "users"
  add_foreign_key "purchases", "users"
  add_foreign_key "requests", "favours"
  add_foreign_key "requests", "users"
  add_foreign_key "users", "achievements"
end
