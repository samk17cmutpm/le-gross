class AddNoteToPackItems < ActiveRecord::Migration[5.0]
  def change
    add_column :pack_items, :note, :string
  end
end
