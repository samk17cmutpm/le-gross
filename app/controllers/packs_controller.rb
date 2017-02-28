class PacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @packs = Pack.all
  end

  def new
    @statuses = ["on the way", "received", "finished"]

    @repositories = Repository.all

    @products = Array.new
    @repositories.each do |repository|
      @products.push(repository.product)
    end

    gon.products = @products.to_json
  end

  def update
  end

  def show
  end

  def create

    @status = params[:status]

    @ids_of_element = params[:ids_of_element].split(",").map { |s| s.to_i }

    @ids_of_element.each do |element|
      @product_id = params["product_id_#{element}"]
      @quantity = params["quantity_of_the_product_#{element}"]

      Pack.create!(
        product_id: @product_id,
        quantity: @quantity,
        status: @status
      )

    end

    redirect_to action: 'index'
  end

  def finished
    @pack_id = params[:id]
    @pack = Pack.find_by(id: @pack_id)
    @pack.update(status: "finished")

    @product = Product.find_by(id: @pack.product.id)

    @repository = Repository.find_by(product_id: @product.id)
    @repository.update(number: @repository.number - @pack.quantity)

    redirect_to action: 'index'
  end

  def received
    redirect_to action: 'index'
  end
end
