class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    # Paid Amount By Customer
    @paid_amount = params[:paid_amount]

    # Creating New Order
    @order = Order.create!(
      :code => Faker::Code.imei,
      :customer_id => @customer_id,
      :date => Date.today.strftime("%a, %e %b %Y"),
      :status => "Waiting",
      :paid_amount => @paid_amount
    )

    @total_price = 0

    # Creating New Oder Items
    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }
    @ids_of_element.each do |element|

      @product_id = params["product_id_#{element}"]
      @number = params["quantity_of_the_product_#{element}"]
      @price = params["price_of_the_product_#{element}"]

      @total_price = @total_price + (@number.to_i * @price.to_i)

      @order.order_items.create!(
        :product_id => @product_id,
        :number => @number,
        :price => @price
      )

      @order.update(total_price: @total_price)
    end

    redirect_to action: 'show', id: @order.id
  end

  def show
    @id = params[:id]
    @order = Order.find_by(id: @id)
    @customer = @order.customer
    @order_items = @order.order_items
  end
end
