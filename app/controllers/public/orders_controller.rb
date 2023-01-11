class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    @total = 0
    @cart_items = current_customer.cart_items.all
    @shipping_fee = 800

    if params[:order][:select_address] == 0
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == 1
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.first_name + @address.last_name
    elsif params[:order][:select_address] == 2
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order = Order.new
      render :confirm

    # if params[:order][:payment_method] == "credit_card"
      # "クレジットカード"
    # else
      # "銀行振込"
    # end

  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)

    if @order.save
      @cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.tax_price = cart.subtotal
        order_detail.save
      end
      redirect_to orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_fee, :invoice_amount)
  end

  def cartitem_nill
    cart_items = current_end_user.cart_items
    if cart_items.blank?
　　  redirect_to cart_items_path
    end
  end

end
