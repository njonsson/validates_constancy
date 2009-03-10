# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 2) do

  create_table "license_plates", :force => true do |t|
    t.string "state"
    t.string "number"
    t.date   "issued_on"
    t.string "color"
    t.string "extra"
  end

  create_table "people", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "social_security_number"
    t.date     "birthdate"
    t.date     "became_important_on"
    t.datetime "first_speeding_ticket_at"
  end

end
