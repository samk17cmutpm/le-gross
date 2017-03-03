class ImportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @import_order_items = ImportOrderItem.all
  end

  def new
    @products = Product.all
    gon.products = @products.to_json
  end

  def create
    @product_id = params[:product_id]
    @quantity_of_the_product = params[:quantity_of_the_product]
    @price_of_the_product = params[:price_of_the_product]
    @status = "Waiting"

    ImportOrderItem.create!(
      product_id: @product_id,
      quantity: @quantity_of_the_product,
      price: @price_of_the_product,
      status: @status
    )

    redirect_to action: 'index'
  end

  def update_status
    @import_order_item = ImportOrderItem.find_by(id: params[:id])
    @import_order_item.update(status: "Done")

    @product_id =  @import_order_item.product.id
    @repository = Repository.find_by(product_id: @product_id)

    if @repository == nil
      Repository.create(
        product_id: @product_id,
        quantity: @import_order_item.number,
        waiting: 0
      )
    else
      @repository.update!(quantity: @repository.quantity + @import_order_item.quantity)
    end

    redirect_to action: 'index'
  end
end
