class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.order_status == "confirm_payment"
      @order_details.update_all(making_status: "waiting_manufacture")
      # @order_details.each do |order_detail|
        # order_detail.making_status = 1
        # order_detail.update(making_status: "waiting_manufacture")
        # order_detail.update
      # end
    end
    redirect_to admin_order_path
  end
end
