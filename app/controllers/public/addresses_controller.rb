class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    # @address.customer_id = current_customer.id
    # @addresses = Address.all
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "Address was successfully created."
      @addresses = current_customer.addresses
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address  was successfully updated."
      @addresses = current_customer.addresses
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice] = "Address  was successfully destroyed."
      @addresses = current_customer.addresses
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  private

  def address_params
      params.require(:address).permit(:name, :postal_code, :address)
  end

end
