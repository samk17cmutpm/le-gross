class DeliveriesController < ApplicationController
  def new
  end

  def index
    @order_items_can_delivery = OrderItem.where(status: "Waiting", can_delivery: true)
    @order_items = OrderItem.where(status: "Waiting")
  end

  def show
  end

  def create
  end

  def delivery
    @order_item = OrderItem.find_by(id: params[:id])
    @local_repository =  Repository.find_by(id: @order_item.repository_id, location: "Local")

    @order_item.update!(
      status: "Deliveried"
    )
    @local_repository.update!(
      quantity: @local_repository.quantity - @order_item.quantity
    )

    @waiting_order_items = OrderItem.where(product_id: @order_item.product_id, status: "Waiting")

    @waiting_order_items.each do |waiting_order_item|
      if waiting_order_item.quantity <= @local_repository.quantity
        waiting_order_item.update(repository_id: @local_repository.id, can_delivery: true)
      else
        waiting_order_item.update(repository_id: nil, can_delivery: false)
      end
    end

    @order = Order.find_by(id: @order_item.order_id)
    @order_items = @order.order_items
    @is_order_deliveried_all = true
    @order_items.each do |order_item|
      if order_item.status == "Waiting"
        @is_order_deliveried_all = false
        break
      end
    end

    if @is_order_deliveried_all
      @order.update!(status: "Deliveried")
    end

    @remote_repository = Repository.find_by(product_id: @order_item.product_id, location: "Remote")
    if @remote_repository.waiting >=  @order_item.quantity
      @remote_repository.update!(
        waiting: @remote_repository.waiting - @order_item.quantity
      )
    end

    redirect_to action: 'index'
  end
end
