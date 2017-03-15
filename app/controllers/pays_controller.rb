class PaysController < ApplicationController
  def index
    @order_items = OrderItem.where(status: "Deliveried").includes(:product).includes(:order)
  end

  def show
  end

  def make_it_paid
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.update(status: "Paid")
    redirect_to action: 'index'
  end

  def paids
    @order_items = OrderItem.where(status: "Paid").includes(:product).includes(:order)
  end
end
