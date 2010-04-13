class PnlController < ApplicationController
  def index
    orders = Order.all
    profit_orders = Order.profit
    loss_orders = Order.loss
    holding_orders = Order.holding
    @number_of_profit_orders = profit_orders.count
    @total_profit = profit_orders.inject(0) {|sum, order| sum + order.pnl }
    @number_of_loss_orders = loss_orders.count
    @total_loss = loss_orders.inject(0) {|sum, order| sum + order.pnl }
    @number_of_holding_orders = holding_orders.count
    @total_holding = holding_orders.inject(0) {|sum, order| sum + order.entry_value }  
    @total_commision = orders.inject(0) {|sum, order| sum + order.total_commission }
    @balance = 0_00
  end
end
