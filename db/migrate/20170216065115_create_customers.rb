class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :status

      t.timestamps
    end
  end
end
