class CreateImportOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :import_orders do |t|
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
