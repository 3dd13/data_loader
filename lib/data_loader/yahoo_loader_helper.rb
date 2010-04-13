require 'open-uri'
require 'date'
require 'logger'
require 'csv'
require 'yahoo_data_parser'

class YahooLoaderHelper
  def initialize(options)
    @stocks = Array.new
    all_stock_numbers(options).each { |stock_no| 
      @stocks << {
        :stock_no => stock_no,
        :history => "http://ichart.yahoo.com/table.csv?s=#{stock_no}&d=0&e=1&f=2050&g=d&a=0&b=1&c=1980&ignore=.csv",
        :last_day => "http://hk.finance.yahoo.com/d/quotes.csv?s=#{stock_no}&f=sl1d1t1c1ohgv&e=.csv"
      }
    }
  end

  def retrieve_all
    stock_prices = nil
    @stocks.each { |stock|
      stock_no = stock[:stock_no]

      last_day_stock_price = YahooParser.download_last_day_snapshot(stock)
      if last_day_stock_price && last_day_stock_price.valid?
        logger.debug "downloading #{stock_no}"
        
        stock_prices = YahooParser.download_history_stock(last_day_stock_price, stock)
      end
    }
    stock_prices
  end

  def retrieve_incremental
    @stocks.each { |stock|
      stock_no = stock[:stock_no]

      if false
        download_missing_stock_prices
      end
    }
  end

  protected

  def all_stock_numbers(options)
    stock_nos = (options[:from]..options[:to]).to_a.map {|num| "#{('%04d' % num).to_s}.HK"}
    stock_nos << "%5EHSI"
  end

  def logger
    @logger ||= Logger.new(File.join(File.dirname(__FILE__), "../../log/data_loader.log"),3,5*1024*1024)
  end
end