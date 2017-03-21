class AddDateToPacks < ActiveRecord::Migration[5.0]
  def change
    add_column :packs, :date, :date
  end
end
