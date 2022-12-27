class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

   private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_image, :genre_id)
  end

end
