class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @products = Product.all;
    @customers = Customer.all
    gon.products = @products.to_json
    gon.customers = @customers.to_json
  end

  def index
    @order_items = OrderItem.all
  end

  def create

    # Customer Id
    @customer_id = params[:customer_id]
    # Paid Amount By Customer
    @paid_amount = params[:paid_amount]

    @number_for_order = Array.new(6){[*"0".."9"].sample}.join
    @characters_for_order = Array.new(2){[*"A".."Z"].sample}.join

    # Creating New Order
    @order = Order.create!(
      :code => @characters_for_order + @number_for_order,
      :customer_id => @customer_id,
      :date => Date.today.strftime("%a, %e %b %Y"),
      :status => "Waiting",
      :paid_amount => @paid_amount
    )

    @total_price = 0

    # Creating New Oder Items
    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }

    @ids_of_element.each do |element|

      # params from clients
      @product_id = params["product_id_#{element}"]
      @quantity = params["quantity_of_the_product_#{element}"]
      @price = params["price_of_the_product_#{element}"]

      @total_price = @total_price + (@quantity.to_i * @price.to_i)

      # get repository in US and Viet Nam
      @remote_repository = Repository.find_by(product_id: @product_id, location: "Remote")
      @local_repository = Repository.find_by(product_id: @product_id, location: "Local")

      if !@local_repository.nil?
        if @quantity.to_i < @local_repository.quantity
          @can_delivery = true
          @local_repository_id = @local_repository.id
        else
          @can_delivery = false
          @local_repository_id = nil
        end
      end

      if !@can_delivery
        if @remote_repository.nil?
          @remote_repository = Repository.create(
            product_id: @product_id,
            quantity: 0,
            waiting: @quantity,
            location: "Remote"
          )
        else
          @remote_repository.update!(waiting: @remote_repository.waiting + @quantity.to_i)
        end
      end

      # Generate code for Order Item
      @number_for_order_item = Array.new(6){[*"0".."9"].sample}.join
      @characters_for_order_item = Array.new(2){[*"A".."Z"].sample}.join

      @order.order_items.create!(
        :product_id => @product_id,
        :quantity => @quantity,
        :price => @price,
        :status => "Waiting",
        :can_delivery => @can_delivery,
        :repository_id => @local_repository_id,
        :code => @characters_for_order_item + @number_for_order_item,
        :date => Date.today.strftime("%a, %e %b %Y")
      )

      @order.update(total_price: @total_price)
    end

    redirect_to action: 'show', id: @order.id
  end

  def show
    @id = params[:id]
    @order = Order.find_by(id: @id)
    @customer = @order.customer
    @order_items = @order.order_items.includes(:product)
  end
end
