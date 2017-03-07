class AddLocationToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :location, :string
  end
end
