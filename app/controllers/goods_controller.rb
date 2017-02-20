class GoodsController < ApplicationController
  def index
    @goods = Product.all
  end
end
