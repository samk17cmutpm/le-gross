class AddWaitingToRepositories < ActiveRecord::Migration[5.0]
  def change
    add_column :repositories, :waiting, :integer
  end
end
