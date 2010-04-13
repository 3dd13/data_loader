require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "profit orders" do
    assert_equal [orders(:gain)], Order.profit
  end

  test "holding orders" do
    assert_equal [orders(:holding)], Order.holding
  end

  test "loss orders" do
    assert_equal [orders(:loss)], Order.loss
  end    

  test "profit p and l should be 10000" do
    assert_equal orders(:gain).pnl, 10000
  end

  test "holding p and l should be 0" do
    assert_equal orders(:holding).pnl, 0
  end

  test "loss p and l should be 178600" do
    assert_equal orders(:loss).pnl, -178600
  end

  test "entry value should be 178600" do
    assert_equal orders(:gain).entry_value, 995100
  end

  test "holding order should only count entry commission as total commission" do 
    order = orders(:holding)
    assert_equal order.entry_commission, order.total_commission
  end

  test "exited order should count entry and exit commission" do
    order = orders(:gain)
    assert_equal order.entry_commission + order.exit_commission, order.total_commission
  end
end
