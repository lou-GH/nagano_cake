class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to request.referer, notice: 'Successfully updated customer status'
  end

  private

  def customer_params
    params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
