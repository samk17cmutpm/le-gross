class DeliveriesController < ApplicationController
  def new
  end

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def create
  end
end
