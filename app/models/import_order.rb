class ImportOrder < ApplicationRecord
  belongs_to :order
  has_many :import_order_items
end
