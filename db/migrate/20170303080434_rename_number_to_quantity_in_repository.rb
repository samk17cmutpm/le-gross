class RenameNumberToQuantityInRepository < ActiveRecord::Migration[5.0]
  def change
    rename_column :repositories, :number, :quantity
  end
end
