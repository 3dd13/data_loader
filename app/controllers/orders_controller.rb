class OrdersController < ApplicationController
  before_filter :find_order, :only => [:show, :edit, :update]
  
  # GET /orders
  def index
    @orders = Order.all
  end
  
  # GET /orders/1
  def show
  end
  
  # GET /orders/new
  def new
    @order = Order.new
  end
  
  # POST /orders
  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "Created successfully."
      redirect_to orders_path
    else
      render :action => "new"
    end
  end
  
  # GET /orders/1/edit
  def edit
  end
    
  # PUT /orders/1
  def update
    if @order.update_attributes(params[:order])
      flash[:notice] = "Updated successfully."
      redirect_to orders_path
    else
      render :action => "edit"
    end
  end
  
  protected 
  
  def find_order
    @order = Order.find(params[:id])    
  end
end
