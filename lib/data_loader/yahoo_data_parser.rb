require 'csv'
require 'stock_daily_price'

class YahooParser
  def self.download_last_day_snapshot(stock)
    last_day_value = nil
    open_with_error_handled(stock[:last_day])  { |f|
      last_day_value = StockDailyPrice.new(CSV.parse_line(f.readline))
    }
    last_day_value
  end

  def self.download_history_stock(last_day_stock_price, stock)
    stock_prices = Array.new
    open_with_error_handled(stock[:history]) { |f|
      skip_header(f)
      
      stock_no = last_day_stock_price.stock_no
      first_history_stock_price = StockDailyPrice.new(CSV.parse_line(f.readline), stock_no)
      if !history_include?(first_history_stock_price, last_day_stock_price)
        stock_prices << last_day_stock_price
      end
      stock_prices << first_history_stock_price
      f.readlines.each { |line|
        stock_prices << StockDailyPrice.new(CSV.parse_line(line), stock_no)
      }
      # TODO convert to use ar-extension
      #require 'ar-extensions'
      #class User
      #end
      #Then to use it, it really couldn't be more straightforward. Use the following in your controller or rake task to import your data:

      #fields = [:first_name, :last_name, :email]
      #data = [["glenn", "gillen", "foo@bar.com"],
      #        ["john", "jones", "jim@bar.com"],
      #        ["steve", "smith", "bar@foo.com"]]

      #User.import fields, data
    }
    stock_prices
  end
  
  protected
  
  def self.history_include?(history_stock_price, last_day_stock_price)
    true
  end

  def self.open_with_error_handled(url)
    begin
      open(url) { |f|
        yield f
      }
    rescue OpenURI::HTTPError
      error_logger.error "http connection error: #{url}"          
    end
  end
  
  def self.skip_header(f)
    f.readline
  end 
  
  def self.error_logger
    @logger ||= Logger.new(File.join(File.dirname(__FILE__), "../../log/data_loader_error.log"),3,5*1024*1024)
  end  
end
