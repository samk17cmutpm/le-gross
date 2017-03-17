class CreateDebts < ActiveRecord::Migration[5.0]
  def change
    create_table :debts do |t|
      t.belongs_to :customer, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
