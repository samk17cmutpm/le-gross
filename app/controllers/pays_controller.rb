class PaysController < ApplicationController
  def index
    @order_items = OrderItem.where(status: "Deliveried").includes(:product).includes(:order)
  end

  def show
  end

  def make_it_paid
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.update(status: "Paid")

    @order = Order.find_by(id: @order_item.order_id)
    @order_items = @order.order_items
    @is_order_paid_all = true

    @order_items.each do |order_item|
      if order_item.status == "Deliveried"
        @is_order_paid_all = false
        break
      end
    end

    if @is_order_paid_all
      @order.update!(status: "Paid")
    end

    redirect_to action: 'index'
  end

  def paids
    @order_items = OrderItem.where(status: "Paid").includes(:product).includes(:order)
  end
end
