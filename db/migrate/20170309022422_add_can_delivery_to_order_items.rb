class AddCanDeliveryToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :can_delivery, :boolean
  end
end
