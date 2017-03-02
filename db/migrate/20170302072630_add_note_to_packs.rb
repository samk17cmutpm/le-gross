class AddNoteToPacks < ActiveRecord::Migration[5.0]
  def change
    add_column :packs, :note, :string
  end
end
