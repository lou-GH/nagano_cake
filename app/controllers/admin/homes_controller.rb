class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).order('created_at DESC')
    @order_details = OrderDetail.where(order_id: params[:id])
  end
end
