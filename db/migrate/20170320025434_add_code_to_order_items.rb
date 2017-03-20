class AddCodeToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :code, :string
  end
end
