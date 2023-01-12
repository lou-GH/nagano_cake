class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "Address was successfully created."
      @addresses = Address.all
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address  was successfully updated."
      @addresses = Address.all
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "Address  was successfully destroyed."
      @addresses = Address.all
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  private

  def address_params
      params.require(:address).permit(:name, :postal_code, :address)
  end

end
