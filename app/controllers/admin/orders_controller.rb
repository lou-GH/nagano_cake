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

    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.make_status = "製作待ち"
        order_detail.save
      end
    end
    redirect_to admin_order_path
  end

  private

    def order_params
      params.require(:order).permit(:status)
    end

end
