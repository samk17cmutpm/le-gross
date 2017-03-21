class RemoveProductIdFromPacks < ActiveRecord::Migration[5.0]
  def change
    remove_column :packs, :product_id
  end
end
