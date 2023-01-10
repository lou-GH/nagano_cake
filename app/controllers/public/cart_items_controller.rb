class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    # どの商品の個数を変更するか
    # 商品の変更update
    # どこのページにとぶのか
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "Cart Item  was successfully update."
      @cart_items = current_customer.cart_items
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      render :index

    end
  end

  def destroy
    # どの商品のデータ
    # 商品削除destroy
    # どこのページに飛ぶのか
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      flash[:notice] = "Cart Item  was successfully destroy."
      @cart_items = current_customer.cart_items
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      render :index
    end
  end

  def destroy_all
    # 全部の商品
    @cart_items = current_customer.cart_items
    if @cart_items.destroy_all
    # どこのページにとぶか
      flash[:notice] = "Cart Items was successfully destroy all."
      @cart_items = current_customer.cart_items
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      render :index
    end
  end

  def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @update_cart_item =  current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])


    # if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
    #   cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #   cart_item.amount += params[:cart_item][:amount].to_i
    #   cart_item.save
    #   flash[:notice] = '商品の個数を変更しました。'
    #   redirect_to cart_items_path
    if @update_cart_item.present?
      # @cart_item.amount + @update_cart_item.amount = @cart_item.amount
      @cart_item.amount += @update_cart_item.amount
      @update_cart_item.destroy
    end
    if @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to cart_items_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      @cart_items = current_customer.cart_items
      render :index
    end
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
