class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :stock_no, :null => false
      t.datetime :entry_date, :null => false
      t.integer :entry_price, :limit => 8, :null => false
      t.integer :entry_commission, :limit => 8, :null => false
      t.datetime :exit_date
      t.integer :exit_price, :limit => 8
      t.integer :exit_commission, :limit => 8
      t.integer :quantity, :limit => 8, :null => false
      t.string :order_type, :null => false
      t.string :status, :default => "holding", :null => false
      t.string :created_by, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
