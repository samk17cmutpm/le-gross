class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.belongs_to :order_item, foreign_key: true
      t.date :date_shipment

      t.timestamps
    end
  end
end
