class AddCodeToPacks < ActiveRecord::Migration[5.0]
  def change
    add_column :packs, :code, :string
  end
end
