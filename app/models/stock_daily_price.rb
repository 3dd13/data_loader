class StockDailyPrice < ActiveRecord::Base
  #if last_day_record_not_exist(second_line, last_day_value)
  #          trade_day = Date.strptime(last_day_value[2], "%m/%d/%Y")
  #  output_file.puts("#{trade_day},#{values[5]},#{values[6]},#{values[7]},#{values[1]},#{values[8]},#{values[1]}\r\n")
  #end
  #p ("#{trade_day},#{values[5]},#{values[6]},#{values[7]},#{values[1]},#{values[8]},#{values[1]}\r\n")

  #def valid_stock?(values)
  #  values && values[2] != 'N/A' && values[4] != 'N/A'
  #end
end
