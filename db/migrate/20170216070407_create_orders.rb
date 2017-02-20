class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, foreign_key: true
      t.string :code
      t.date :date
      t.decimal :total_price
      t.decimal :paid_amount
      t.string :status

      t.timestamps
    end
  end
end
