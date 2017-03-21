class AddCodeToPackItems < ActiveRecord::Migration[5.0]
  def change
    add_column :pack_items, :code, :string
  end
end
