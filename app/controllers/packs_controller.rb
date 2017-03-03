class PacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @packs = Pack.all.includes(:product)
  end

  def new
    @shipment_by_list = ["Airplane", "Truck", "Others"]

    @repositories = Repository.all.includes(:product)

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
  end

  def create
    @repositories = Repository.all
    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }
    @ids_of_element.each do |element|

      # Generate Code For Pack
      @pack_code = loop do
        pack_code_temp = Faker::Code.asin
        break pack_code_temp unless Pack.exists?(:code => pack_code_temp)
      end

      # Get params from server
      @product_id = params["product_id_#{element}"]
      @quantity = params["quantity_of_the_product_#{element}"]
      @note = params["note_of_the_product_#{element}"]
      @shipment_by = params["shipment_by_#{element}"]

      # Find Product In Repository
      @repository = @repositories.find_by(product_id: @product_id)

      if (@repository.quantity >= @quantity.to_i)
        @pack = Pack.create!(
            code: @pack_code,
            product_id: @product_id,
            quantity: @quantity,
            status: "On The Way",
            note: @note,
            shipment_by: @shipment_by
        )
        # Update Repository
        @repository.update(quantity: @repository.quantity - @pack.quantity)
      end

    end
    redirect_to action: 'index'
  end

  def finished
    @pack_id = params[:id]
    @pack = Pack.find_by(id: @pack_id)
    @pack.update(status: "Finished")
    redirect_to action: 'index'
  end

  def received
    redirect_to action: 'index'
  end
end
