require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :success
  end

  test "show" do
    order = orders(:gain)
    get :show, :id => order
    assert_response :success
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    post :create, :order => some_options
    assert_redirected_to orders_path
  end

  test "create with missing stock_no should display error messages" do;
    options = some_options
    options[:stock_no] = nil
    post :create, :order => options
    assert_response :success
  end

  test "edit" do
    order = orders(:gain)
    get :edit, :id => order
    assert_response :success
  end

  test "update" do
    order = orders(:gain)
    put :update, :id => order.to_param, :order => some_options
    assert_redirected_to orders_path
  end

  test "update with missing fields should display error messages" do
    order = orders(:gain)
    options = some_options
    options[:entry_date] = nil
    put :update, :id => order.to_param, :order => options
    assert_response :success
  end
  
  def some_options
    {
      stock_no:           1234,
      entry_date:   Date.today,
      entry_price:        9951,
      entry_commission:    200,
      exit_date:    Date.today,
      exit_price:        10051,
      exit_commission:     200,
      quantity:            100,
      order_type: "long_entry",
      status:         "exited",
      created_by:        "lame"    
    }
  end
end
