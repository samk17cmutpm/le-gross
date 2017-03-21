class AddShipmentByToPackItems < ActiveRecord::Migration[5.0]
  def change
    add_column :pack_items, :shipment_by, :string
  end
end
