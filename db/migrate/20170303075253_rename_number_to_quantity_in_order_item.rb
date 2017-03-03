class RenameNumberToQuantityInOrderItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :order_items, :number, :quantity
  end
end
