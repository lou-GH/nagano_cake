class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    # どの商品の個数を変更するか
    # 商品の変更update
    # どこのページにとぶのか
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "CartItem  was successfully update."
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
    if @cart_item.destroy(cart_item_params)
      flash[:notice] = "CartItem  was successfully destroy."
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
      flash[:{notice}] = "CartItems was successfully destroy_all."
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
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
  end

end
