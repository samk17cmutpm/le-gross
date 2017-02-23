class OrdersController < ApplicationController
  def new
    @products = Product.all;
    @customers = Customer.all
    gon.products = @products.to_json
    gon.customers = @customers.to_json
  end

  def index
  end
end
