class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    # どの商品の個数を変更するか
    # 商品の変更update
    # どこのページにとぶのか
  end

  def destroy
    # どの商品のデータ
    # 商品削除destroy
    # どこのページに飛ぶのか
  end

  def destroy_all
    # 全部の商品
    
    current_customer.cart_items.destroy_all
    # どこのページにとぶか
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
