class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = 'Successfully updated customer'
      redirect_to admin_customer_path(@customer.id)
    else
      @customer = Customer.find(params[:id])
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customers).permit(:is_deleted)
  end

end
