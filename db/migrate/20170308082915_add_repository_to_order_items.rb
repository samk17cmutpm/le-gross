class AddRepositoryToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_items, :repository, foreign_key: true
  end
end
