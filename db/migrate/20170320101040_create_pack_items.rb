class CreatePackItems < ActiveRecord::Migration[5.0]
  def change
    create_table :pack_items do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :pack, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
