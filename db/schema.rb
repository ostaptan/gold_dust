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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121224230101) do

  create_table "tickets", :force => true do |t|
    t.string   "title",         :limit => 100,                       :null => false
    t.string   "priority",                     :default => "medium"
    t.integer  "assigned_to"
    t.text     "body"
    t.text     "history"
    t.integer  "status",                       :default => 0
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "reporter_mail"
    t.string   "reporter"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                              :null => false
    t.string   "password_digest",                                   :null => false
    t.string   "phone",            :limit => 20
    t.string   "gender",           :limit => 1
    t.boolean  "active",                         :default => false
    t.integer  "is_admin",                       :default => 0
    t.string   "surname"
    t.string   "mail",                                              :null => false
    t.string   "avatar"
    t.string   "settings"
    t.integer  "login_count",                    :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "ticket_id"
  end

end
