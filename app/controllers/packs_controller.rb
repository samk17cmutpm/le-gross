class PacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @packs = Pack.all
  end

  def new
    @statuses = ["On the way", "Received", "Finished"]

    @repositories = Repository.all.includes(:product)

    @products = Array.new
    @repositories.each do |repository|
      @products.push(repository.product)
    end

    gon.repositories = @repositories.to_json
    gon.products = @products.to_json
  end

  def update
  end

  def show
  end

  def create
    @repositories = Repository.all
    @status = params[:status]
    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }
    @ids_of_element.each do |element|

      @product_id = params["product_id_#{element}"]
      @quantity = params["quantity_of_the_product_#{element}"]

      @repository = @repositories.find_by(product_id: @product_id)

      if (@repository.number >= @quantity.to_i)
        @pack = Pack.create!(
            product_id: @product_id,
            quantity: @quantity,
            status: @status
        )
        @repository.update(number: @repository.number - @pack.quantity)
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
