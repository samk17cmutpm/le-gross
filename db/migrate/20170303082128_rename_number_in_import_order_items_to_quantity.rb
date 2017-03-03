class RenameNumberInImportOrderItemsToQuantity < ActiveRecord::Migration[5.0]
  def change
    rename_column :import_order_items, :number, :quantity
  end
end
