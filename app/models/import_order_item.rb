class ImportOrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :container
  belongs_to :import_order
end
