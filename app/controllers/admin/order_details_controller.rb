class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    if @order_details.where(making_status: "manufacturing").count >= 1
      @order.update(order_status: "making")
      # @order.order_status = "making"
      # @order.update
    end

    if @order.order_details.count == @order_details.where(making_status: "finish").count
      @order.update(order_status: "preparing_ship")
    end

    redirect_to admin_order_path(@order)
  end

   private

    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end

end
