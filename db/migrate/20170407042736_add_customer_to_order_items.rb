class AddCustomerToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_items, :customer, foreign_key: true
  end
end
