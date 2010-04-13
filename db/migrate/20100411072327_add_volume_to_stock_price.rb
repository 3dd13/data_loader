class AddVolumeToStockPrice < ActiveRecord::Migration
  def self.up
    add_column :stock_daily_prices, :volume, :integer, :limit => 8, :default => 0, :null => false
  end

  def self.down
    drop_column :stock_daily_prices, :volume
  end
end
