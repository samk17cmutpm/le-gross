class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.belongs_to :product, foreign_key: true
      t.integer :number
      t.string :status

      t.timestamps
    end
  end
end
