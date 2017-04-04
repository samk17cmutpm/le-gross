class PaysController < ApplicationController
  def index
    @order_items = OrderItem.where(status: "Deliveried").includes(:product).includes(:order)
    gon.order_items = @order_items.to_json
  end

  def show
  end

  def make_it_paid
    @order_item = OrderItem.find_by(id: params[:id])
    @paid_amount = params[:paid_amount].to_i

    if @order_item.price * @order_item.quantity == @paid_amount
      @status = "Paid"
    else
      @status = "Owned"
    end

    @order_item.update(
      status: @status,
      paid_amount: @paid_amount
    )

    @order = Order.find_by(id: @order_item.order_id)

    @order_items = @order.order_items
    @is_order_paid_all = true

    @order_items.each do |order_item|
      if order_item.status == "Deliveried" || order_item.status == "Owned"
        @is_order_paid_all = false
        break
      end
    end

    if @is_order_paid_all
      @order.update!(status: "Paid")
    else
      @order.update!(status: "Owned")
    end

    redirect_to action: 'index'
  end

  def paids
    @order_items = OrderItem.where(status: "Paid").includes(:product).includes(:order)
  end
end
