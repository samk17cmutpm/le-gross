class AddPaidAmountToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :paid_amount, :decimal
  end
end
