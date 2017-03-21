class PacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @packs = Pack.all
  end

  def new
    @shipment_by_list = ["Airplane", "Truck", "Others"]

    @repositories = Repository.where(location: "Remote").where("quantity > ?", 0).includes(:product)

    @products = Array.new
    @repositories.each do |repository|
      @products.push(repository.product)
    end

    gon.repositories = @repositories.to_json
    gon.products = @products.to_json
    gon.shipment_by_list = @shipment_by_list.to_json
  end

  def update
  end

  def show
    @pack = Pack.find_by(id: params[:id])
  end

  def create
    @remote_repositories = Repository.where(location: "Remote")
    @on_the_way_repositories = Repository.where(location: "On The Way")
    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }

    @shipment_by = params["shipment_by"]
    @note = params["note"]

    # Generate Code For Pack
    @pack_code = loop do
      pack_code_temp = Faker::Code.asin
      break pack_code_temp unless Pack.exists?(:code => pack_code_temp)
    end

    @pack = Pack.create!(
        code: @pack_code,
        status: "On The Way",
        date: Date.today.strftime("%a, %e %b %Y"),
        shipment_by: @shipment_by,
        note: @note
    )

    @ids_of_element.each do |element|
      # Get params from server
      @product_id = params["product_id_#{element}"]
      @quantity = params["quantity_of_the_product_#{element}"]
      @note = params["note_of_the_product_#{element}"]

      # Find Product In Repository
      @remote_repository = @remote_repositories.find_by(product_id: @product_id)

      if (@remote_repository.quantity >= @quantity.to_i)

        @pack_item = @pack.pack_items.create(
          product_id: @product_id,
          quantity: @quantity.to_i,
          shipment_by: @shipment_by,
          note: @note
        )
        # Update Repository
        @remote_repository.update(quantity: @remote_repository.quantity - @quantity.to_i)

        # This is for ON THE WAY REPOSITORY
        @on_the_way_repository = @on_the_way_repositories.find_by(product_id: @product_id)

        if @on_the_way_repository != nil
          @on_the_way_repository.update(quantity: @on_the_way_repository.quantity + @quantity.to_i)
        else
          Repository.create!(
            product_id: @product_id,
            quantity: @quantity.to_i,
            waiting: 0,
            location: "On The Way"
          )
        end

      end

    end
    redirect_to action: 'index'
  end

  def finished
    @pack_id = params[:id]
    @pack = Pack.find_by(id: @pack_id)
    @pack.update(status: "Finished")

    @on_the_way_repositories = Repository.where(location: "On The Way")

    @local_repositories  = Repository.where(location: "Local")

    @pack.pack_items.each do |pack_item|

      @on_the_way_repository = @on_the_way_repositories.find_by(product_id: pack_item.product_id)

      @on_the_way_repository.update(quantity: @on_the_way_repository.quantity - pack_item.quantity)

      @local_repository = @local_repositories.find_by(product_id: pack_item.product_id)

      if !@local_repository.nil?
        @local_repository.update(quantity: @local_repository.quantity + pack_item.quantity)
      else
        @local_repository = Repository.create!(
          product_id: pack_item.product_id,
          quantity: pack_item.quantity,
          waiting: 0,
          location: "Local"
        )
      end

      @waiting_order_items = OrderItem.where(product_id: pack_item.product_id, status: "Waiting")

      @waiting_order_items.each do |waiting_order_item|
        if waiting_order_item.quantity <= @local_repository.quantity
          waiting_order_item.update(repository_id: @local_repository.id, can_delivery: true)
        else
          waiting_order_item.update(repository_id: nil, can_delivery: false)
        end
      end

    end





    redirect_to action: 'index'
  end

  def received
    redirect_to action: 'index'
  end
end
