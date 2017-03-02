class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @customers = Customer.all
  end

  def new
  end

  def show
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
  end

  def create
    @email = params[:email]
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @address = params[:address]
    @phone_number = params[:phone_number]

    Customer.create!(
      email: @email,
      first_name: @first_name,
      last_name: @last_name,
      address: @address,
      phone_number:  @phone_number
    )
    redirect_to action: 'index'
  end

  def update
    @id = params[:id]
    @email = params[:email]
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @address = params[:address]
    @phone_number = params[:phone_number]

    @customer = Customer.find_by(id: @id)
    @customer.update!(
      email: @email,
      first_name: @first_name,
      last_name: @last_name,
      address: @address,
      phone_number:  @phone_number
    )
    redirect_to action: 'index'
  end
end
