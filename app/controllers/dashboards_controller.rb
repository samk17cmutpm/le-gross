class DashboardsController < ApplicationController

  def index
  end

  def debts

  end

  def not_received_feedback
  end

  def not_full_paid
    @order_items = OrderItem.where(status: "Owned")
  end

  def make_it_paid

    @order_item = OrderItem.find_by(id: params[:id])

    @order_item.update(
      status: "Paid"
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

    redirect_to action: 'not_full_paid'

  end

  def customers_need_to_pay
    @customers_id = Order.where(status: "Owned").group("customer_id").count
    @arrs = @customers_id.keys
    @customers = Customer.where("id = ?", @arrs)
  end

  def owned_orders
    @order_items = OrderItem.where(status: "Owned", customer_id: params[:id])
  end

end
