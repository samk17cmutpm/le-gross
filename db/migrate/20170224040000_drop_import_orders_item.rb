class DropImportOrdersItem < ActiveRecord::Migration[5.0]
  def up
    drop_table :import_orders_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
