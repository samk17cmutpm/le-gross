class DeliveriesController < ApplicationController
  def new
  end

  def index
    @order_items = OrderItem.where(status: "Waiting", can_delivery: true)
  end

  def show
  end

  def create
  end
end
