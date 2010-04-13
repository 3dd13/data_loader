class Order < ActiveRecord::Base
  validates_presence_of :stock_no, :entry_date, :entry_price, :entry_commission, :quantity, :order_type, :status, :created_by
  validates_presence_of :exit_date, :exit_price, :exit_commission, :if => :exit?
  validates_numericality_of :entry_price, :entry_commission, :quantity, :greater_than => 0
  validates_numericality_of :exit_price, :exit_commission, :greater_than => 0, :if => :exit?

  HOLDING = "holding".freeze
  EXITED = "exited".freeze
  ORDER_STATUSES = [HOLDING, EXITED]
  validates_inclusion_of :status, :in => ORDER_STATUSES

  LONG_ENTRY = "long_entry".freeze
  LONG_EXIT = "long_exit".freeze
  SHORT_ENTRY = "short_entry".freeze
  SHORT_EXIT = "short_exit".freeze
  MARKET_ENTRY = "market_entry".freeze
  MARKET_EXIT = "market_exit".freeze  
  ORDER_TYPES = [LONG_ENTRY, LONG_EXIT, SHORT_ENTRY, SHORT_EXIT, MARKET_ENTRY, MARKET_EXIT]
  validates_inclusion_of :order_type, :in => ORDER_TYPES

  scope :profit, lambda {
    where("orders.exit_price > orders.entry_price")
  }
  scope :loss, lambda {
    where("orders.entry_price > orders.exit_price")
  }
  scope :holding, lambda {
    where("orders.exit_price is null")
  }

  def exit?
    self.exit_date || self.exit_price || self.exit_commission
  end

  def pnl
    exit_price ? (self.exit_price - self.entry_price) * quantity : 0_00
  end

  def entry_value
    self.entry_price * self.quantity
  end

  def total_commission
    self.entry_commission.to_i + self.exit_commission.to_i
  end

end
