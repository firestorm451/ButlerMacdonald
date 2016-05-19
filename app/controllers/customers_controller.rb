class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to new_customer_path
    else
      render :new
    end
  end

  def update
    @customer = Customer.new(customer_params)
    @customer.attributes = customer_params
    if @customer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
