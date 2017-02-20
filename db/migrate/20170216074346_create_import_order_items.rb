class CreateImportOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :import_order_items do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :container, foreign_key: true
      t.decimal :price
      t.integer :number
      t.string :status
      t.belongs_to :import_order, foreign_key: true

      t.timestamps
    end
  end
end
