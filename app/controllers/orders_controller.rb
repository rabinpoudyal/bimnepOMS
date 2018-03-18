class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = Order.all
    #@orders_today = Order.where(delivery_date: Date.today, order_status: "Pending")
    @follow_up_orders_today = Order.where(delivery_date: Date.today, order_status: "Follow Up")
  end

  def completed_order
    @orders = Order.where(order_status: "Delivered")
  end

  def cancelled_order
    @orders = Order.where(order_status: "Cancelled")
  end

  def follow_up
    @orders = Order.where(order_status: "Follow Up")
  end

  def packed_order
    @orders = Order.where(order_status: "Packed")
  end

  def pending_order
    @orders = Order.where(order_status: "Pending")
  end

  def out_of_stock
    @orders = Order.where(order_status: "Out of stock")
  end

  def returned
    @orders = Order.where(order_status: "Returned")
  end

  def delivered
    @orders = Order.where(order_status: "Delivered")
  end

  def incomplete_order
    @orders = Order.where(order_status: "Incomplete Order")
  end

  def not_confrimed_order
    @orders = Order.where(order_status: "Not Confrimed")
  end

  def statistics
    
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params.require(:order).permit(:name, :phone, :address, :delivery_date, :product_id, :payment_option,:payment_method, :amount, :order_status, :description, :district))

    if @order.save
      redirect_to orders_path, :notice=> 'Order was successfully created.'
    else
      redirect_to new_order_path, :alert=> 'Error! Please try again'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(params.require(:order).permit(:name, :phone, :address, :delivery_date, :product_id, :payment_option,:payment_method, :amount, :order_status, :description, :district))
      redirect_to :back, :notice=> 'Order was successfully updated.'
    else
      redirect_to new_order_path, :alert=> 'Error! Please try again'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path, :notice => 'Order was successfully deleted.'
    else
      redirect_to orders_path, :alert => 'Error! Please try again'
    end
  end
end
