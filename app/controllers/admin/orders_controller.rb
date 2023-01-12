class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])

    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  def update
  end
end
