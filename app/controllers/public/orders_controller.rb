class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = CartItem.item_id
        order_detail.order_id = @order.id
        order_detail.amount = CartItem.item.amount
        order_detail.tax_price = CartItem.subtotal
        order_detail.save
      end
      redirect_to new_order_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
