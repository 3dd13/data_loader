# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100411072327) do

  create_table "orders", :force => true do |t|
    t.string   "stock_no",                                             :null => false
    t.datetime "entry_date",                                           :null => false
    t.integer  "entry_price",      :limit => 8,                        :null => false
    t.integer  "entry_commission", :limit => 8,                        :null => false
    t.datetime "exit_date"
    t.integer  "exit_price",       :limit => 8
    t.integer  "exit_commission",  :limit => 8
    t.integer  "quantity",         :limit => 8,                        :null => false
    t.string   "order_type",                                           :null => false
    t.string   "status",                        :default => "holding", :null => false
    t.string   "created_by",                                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_daily_prices", :force => true do |t|
    t.string   "stock_no",                                  :null => false
    t.datetime "trade_date",                                :null => false
    t.integer  "open",       :limit => 8, :default => 0,    :null => false
    t.integer  "close",      :limit => 8, :default => 0,    :null => false
    t.integer  "high",       :limit => 8, :default => 0,    :null => false
    t.integer  "low",        :limit => 8, :default => 0,    :null => false
    t.boolean  "adjusted",                :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "volume",     :limit => 8, :default => 0,    :null => false
  end

end
