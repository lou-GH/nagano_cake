class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer

  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "You have updated customer successfully."
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
