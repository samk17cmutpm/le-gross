class AddShipmentByToPacks < ActiveRecord::Migration[5.0]
  def change
    add_column :packs, :shipment_by, :string
  end
end
