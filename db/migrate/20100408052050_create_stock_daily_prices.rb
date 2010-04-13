class CreateStockDailyPrices < ActiveRecord::Migration
  def self.up
    create_table :stock_daily_prices do |t|
      t.string :stock_no, :null => false
      t.datetime :trade_date, :null => false
      t.integer :open, :limit => 8, :default => 0, :null => false
      t.integer :close, :limit => 8, :default => 0, :null => false
      t.integer :high, :limit => 8, :default => 0, :null => false
      t.integer :low, :limit => 8, :default => 0, :null => false
      t.boolean :adjusted, :default => true, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :stock_daily_prices
  end
end
