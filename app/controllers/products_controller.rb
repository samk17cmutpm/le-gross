class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
  end

  def new
  end

  def update
    @product = Product.find_by(id: params[:product_id])
    @product_name = params[:product_name]
    @product_description = params[:product_description]
    @product.update(
      name: @product_name,
      description: @product_description
    )
    redirect_to action: 'index'
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def create
    @product_name = params[:product_name]
    @product_description = params[:product_description]
    @product_code = loop do
      product_code_temp = Faker::Code.asin
      break product_code_temp unless Product.exists?(:code => product_code_temp)
    end
    Product.create!(
      name: @product_name,
      code: @product_code,
      description: @product_description
    )
    redirect_to action: 'index'
  end
end
