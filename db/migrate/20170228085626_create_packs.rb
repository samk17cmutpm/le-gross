class CreatePacks < ActiveRecord::Migration[5.0]
  def change
    create_table :packs do |t|
      t.integer :quantity
      t.belongs_to :product
      t.string :status

      t.timestamps
    end
  end
end
