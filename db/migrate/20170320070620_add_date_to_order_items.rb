class AddDateToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :date, :date
  end
end
