class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @products = Product.all;
    @customers = Customer.all
    gon.products = @products.to_json
    gon.customers = @customers.to_json
  end

  def index
    @orders = Order.all
  end

  def create

    # Customer Id
    @customer_id = params[:customer_id]

    # Creating New Order
    @order = Order.create!(
      :customer_id => @customer_id,
      :date => Date.today.strftime("%a, %e %b %Y"),
      :status => "Waiting"
    )

    # Creating New Oder Items
    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }
    @ids_of_element.each do |element|
      @product_id = params["product_id_#{element}"]
      @number = params["quantity_of_the_product_#{element}"]
      @order.order_items.create!(
        :product_id => @product_id,
        :number => @number
      )
    end

    redirect_to action: 'index'
  end
end
