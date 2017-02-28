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
    @status = "waiting"

    ImportOrderItem.create!(
      product_id: @product_id,
      number: @quantity_of_the_product,
      price: @price_of_the_product,
      status: @status
    )
    
    redirect_to action: 'index'
  end
end