class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      flash[:notice] = "Item was successfully created."
      redirect_to admin_items_path(@item)
    else
      @items = Item.all
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "Item was successfully update."
      redirect_to admin_items_path(@item.id)
    else
      @items = Item.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_image, :genre_id)
  end

end
