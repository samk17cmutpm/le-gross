class Delivery < ApplicationRecord
  belongs_to :order_item
end
