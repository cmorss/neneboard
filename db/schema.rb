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

ActiveRecord::Schema.define(:version => 20110624024112) do

  create_table "artists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", :force => true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.integer  "style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborators", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "renderers", :force => true do |t|
    t.integer  "stencil_id", :null => false
    t.integer  "style_id",   :null => false
    t.text     "script",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shapes", :force => true do |t|
    t.integer  "stencil_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "height"
    t.integer  "width"
    t.integer  "radius"
    t.integer  "rotation"
    t.string   "text"
    t.integer  "scaleX"
    t.integer  "scaleY"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stencils", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
