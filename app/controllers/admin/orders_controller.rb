class Admin::OrdersController < ApplicationController
  def show
    # @customer = Customer.find(params[:id])
    # @orders = @customer.orders.page(params[:page])

    # @order_details = OrderDetail.where(order_id: params[:id])
    # @order = Order.find(params[:id])

    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @shipping_fee = 800
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.order_status == "confirm_payment"
      @order_details.each do |order_detail|
        order_detail.manufacture_status = "waiting_manufacture"
        order_detail.update(order_detail_params)
      end
    end
    redirect_to admin_order_path
  end

  private

    def order_params
      params.require(:order).permit(:order_status)
    end

    def order_detail_params
      params.require(:order_detail).permit(:manufacture_status)
    end

end
