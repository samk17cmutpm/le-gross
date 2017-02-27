class RemoveStatusFromRepositories < ActiveRecord::Migration[5.0]
  def change
    remove_column :repositories, :status, :string
  end
end
