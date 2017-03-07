class CreateFakes < ActiveRecord::Migration[5.0]
  def change
    create_table :fakes do |t|
      t.string :data

      t.timestamps
    end
  end
end
