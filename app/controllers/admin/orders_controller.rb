class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])
  end

  def update
  end
end
